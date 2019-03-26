library(NutrienTrackeR)


### Name: nutrientPiePlot
### Title: Visualize the main foods contributing to the intake levels of a
###   nutrient
### Aliases: nutrientPiePlot

### ** Examples

## Load data
data(food_composition_data)
data(NHI_nutrient_recommendations)
data(nutrient_group)
data(sample_diet_USDA) ## contains an example of a one-week diet

## Get daily intake
balanceF <- dietBalance(my_daily_food = sample_diet_USDA,
                        food_database = "USDA", age = 27, gender = "female")

## Generate plots
nutrientPiePlot(daily_intake = balanceF, nutrient_name = "Fiber, total dietary (g)")
nutrientPiePlot(daily_intake = balanceF, nutrient_name = "Magnesium, Mg (mg)")
nutrientPiePlot(daily_intake = balanceF, nutrient_name = "Calcium, Ca (mg)")
nutrientPiePlot(daily_intake = balanceF, nutrient_name = "Niacin (mg)")



