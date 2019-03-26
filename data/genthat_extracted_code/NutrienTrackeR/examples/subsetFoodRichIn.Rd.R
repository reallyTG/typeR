library(NutrienTrackeR)


### Name: subsetFoodRichIn
### Title: Find nutrient-rich foods
### Aliases: subsetFoodRichIn

### ** Examples

## Load data
data(food_composition_data)

## Get foods rich in niacin
subsetFoodRichIn(nutrient_name = "Niacin (mg)", food_database = "USDA", n = 5)
subsetFoodRichIn(nutrient_name = "Niacin (mg)", food_database = "CIQUAL", n = 5)
subsetFoodRichIn(nutrient_name = "Niacin (mg)", food_database = "BEDCA", n = 5)

## Get foods rich in niacin from CIQUAL within the group "diary products and deserts"
subsetFoodRichIn(nutrient_name = "Niacin (mg)", food_database = "CIQUAL", n = 5, 
                 food_group = "dairy products and deserts")



