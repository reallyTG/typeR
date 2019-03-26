library(NutrienTrackeR)


### Name: nutrientIntakePlot
### Title: Visualize nutrient intake levels
### Aliases: nutrientIntakePlot

### ** Examples

## Load data
data(food_composition_data)
data(NHI_nutrient_recommendations)
data(nutrient_group)
data(sample_diet_USDA) ## contains an example of a one-week diet

## Get daily intake
balanceF <- dietBalance(my_daily_food = sample_diet_USDA,
                       food_database = "USDA", age = 27, gender = "female")

## Generate plot
nutrientIntakePlot(daily_intake = balanceF)



