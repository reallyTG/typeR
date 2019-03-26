library(NutrienTrackeR)


### Name: nutrientsTimeTrend
### Title: Visualize time trends of nutrient intake levels
### Aliases: nutrientsTimeTrend

### ** Examples

## Load data
data(food_composition_data)
data(NIH_nutrient_recommendations)
data(nutrient_group)
data(sample_diet_USDA) ## contains an example of a one-week diet

## Generate plots
nutrientsTimeTrend(my_daily_food = sample_diet_USDA, food_database = "USDA",
                   age = 27, gender = "female")

nutrientsTimeTrend(my_daily_food = sample_diet_USDA, food_database = "USDA",
                   nutrients = c("Calcium, Ca (mg)", "Iron, Fe (mg)"), age = 27,
                   gender = "female")



