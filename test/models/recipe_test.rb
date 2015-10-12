require 'test_helper' 
class RecipeTest < ActiveSupport::TestCase  
    def setup 
        @chef = Chef.create(name: "bob", email: "bob@example.com")
        @recipe = @chef.recipes.build(name: "chiken parm", summary: "bad taste but try", description: "just meat, don't cook eat as it is but fast vey fast")      
    end
    
    test "recipe should be valid" do 
        assert @recipe.valid?
    end
    
    test "chef_id should be present" do 
        @recipe.chef_id = nil 
        assert_not @recipe.valid?
    end 
    
    test "name should be present" do  
        @recipe.name = " " 
        assert_not @recipe.valid?   
    end
    
    test "name should be not to short" do 
        @recipe.name = "a"*4
        assert_not @recipe.valid?
    end

    test "name length should not be to long" do
        @recipe.name = "a"*101
        assert_not @recipe.valid?
    end

    test "summary should be present" do
        @recipe.name = " "
        assert_not @recipe.valid?
    end
    
    test "summary should not be to short" do
        @recipe.summary = "a"*9
        assert_not @recipe.valid?
    end
    
    test "summary should not be to long" do
        @recipe.summary = "a"*151
        assert_not @recipe.valid?
    end
    
    test "description should be present" do
        @recipe.description = " "
        assert_not @recipe.valid?
    end
    
    test "description should not be too short" do
        @recipe.description = "a"*19
        assert_not @recipe.valid?
    end
    
    test "description should not be too long" do
        @recipe.description = "a"*501
        assert_not @recipe.valid?
    end
end