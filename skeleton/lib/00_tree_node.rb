class PolyTreeNode
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent
    @parent
  end 
  
  def children
    @children
  end 
  
  def value
    @value
  end
  
  def parent=(parent_node)
    if parent_node
      @parent.children.delete(self) unless @parent.nil?
      @parent = parent_node
      @parent.children << self unless parent_node.children.include?(self)
    else
      @parent.children.delete(self) unless @parent.nil?
      @parent = nil
    end
  end
  
  def add_child(child_node)
    child_node.parent=(self)
  end 
  
  def remove_child(child_node)
    raise "That's not my child!" unless @children.include?(child_node)
    child_node.parent=(nil)
  end
  
  def inspect
    "value: #{value} parent: #{parent} children: #{children.map {|child| child.value}}"
  end 
  
  def dfs(target_value)
    return self if self.value == target_value
    @children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end 
    nil
  end

end