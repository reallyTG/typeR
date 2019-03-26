library(yummlyr)


### Name: search_recipes
### Title: Search recipes on Yummly.com
### Aliases: search_recipes

### ** Examples

## Not run: 
##D # search for recipes with bacon
##D search_recipes("bacon")
##D 
##D # search for recipes with bacon that have pictures
##D search_recipes("bacon", require_pictures = TRUE)
##D 
##D # search for "Onion Soup" recipes which include garlic and cognac
##D search_recipes("Onion Soup", allowed_ingredient = c("garlic", "cognac"))
##D 
##D # search for "Onion Soup" recipes which do not include "onion soup mix" 
##D search_recipes("Onion Soup", excluded_ingredient = c("onion soup mix"))
##D 
##D # search for "Onion Soup" recipes that are Dairy-Free and Gluten-Free
##D search_recipes("bacon", allowed_allergy =c("Dairy-Free", "Gluten-Free"))
##D 
##D # search for "Onion Soup" recipes that are Pescetarian and Lacto vegetarian
##D search_recipes("bacon", allowed_diet =c("Pescetarian", "Lacto vegetarian")
##D 
##D # search for "Onion Soup" recipes that match American Cuisine
##D search_recipes("bacon", allowed_cuisine =c("American")
##D 
##D # exclude American recipes from a search for "Onion Soup"
##D search_recipes("bacon", excluded_cuisine =c("American")
##D 
##D # search for "Onion Soup" recipes that are Appetizers
##D search_recipes("bacon", allowed_course =c("Appetizers")
##D 
##D # exclude Appetizer recipes from a search for "Onion Soup" 
##D search_recipes("bacon", excluded_course =c("Appetizers")
##D 
##D # search for "Onion Soup" recipes for Thanksgiving 
##D search_recipes("bacon", allowed_holiday =c("Thanksgiving")
##D 
##D # exclude Thanksgiving recipes from a search for "Onion Soup"
##D search_recipes("bacon", excluded_holiday =c("Thanksgiving")
##D 
##D # if you want 20 recipes per page and want to see the second page of results
##D search_recipes("bacon", max_results = 20)
##D 
##D # if you want to start with position 20
##D search_recipes("bacon", start = 20)
##D 
##D # looking for recipes with a lot of Potassium, try setting a min of 3000 mg
##D # and a max of the Daily Suggested Value of 3500 mg
##D search_recipes("bacon", nutrition = list(Calcium=list(min=3, max=3.5)))
##D 
##D #  search for recipes which are very sweet but are not very spicy,
##D search_recipes("bacon", flavor = list(sweet=list(min=0.1, max=1)))
## End(Not run)



