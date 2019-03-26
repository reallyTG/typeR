library(NutrienTrackeR)


### Name: dietBalance
### Title: Nutrition calculator
### Aliases: dietBalance

### ** Examples

## Load data
data(food_composition_data)
data(NIH_nutrient_recommendations)
data(nutrient_group)
data(sample_diet_USDA) ## contains an example of a one-week diet
day1 = sample_diet_USDA[[1]]

weekly_balanceF <- dietBalance(my_daily_food = sample_diet_USDA,
                              food_database = "USDA", age = 27, gender = "female")

day1_balanceF <- dietBalance(my_daily_food = day1,
                            food_database = "USDA", age = 27, gender = "female")

day1_balanceM <- dietBalance(my_daily_food = day1,
                            food_database = "USDA", age = 27, gender = "male")

day1_balanceF <- dietBalance(my_daily_food = day1,
                            food_database = "USDA", age = 27, gender = "male")



