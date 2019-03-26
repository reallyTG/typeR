library(NutrienTrackeR)


### Name: findFoodName
### Title: Find food names based on keywords
### Aliases: findFoodName

### ** Examples

## Load data
data(food_composition_data)

findFoodName(keywords = c("Rice", "brown", "raw"), food_database = "USDA")
findFoodName(keywords = c("Rice", "brown", "raw"), food_database = "CIQUAL")
findFoodName(keywords = c("Rice", "brown", "raw"), food_database = "BEDCA")



