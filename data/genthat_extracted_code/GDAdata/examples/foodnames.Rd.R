library(GDAdata)


### Name: foodnames
### Title: Nutritional value of food.
### Aliases: foodnames
### Keywords: datasets

### ** Examples

data(foodnames, package="GDAdata")
summary(foodnames)
library(ggplot2)
ggplot(foodnames, aes(Fat.grams, Saturated.fat.grams)) + geom_point()



