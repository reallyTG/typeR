library(simukde)


### Name: find_best_fit
### Title: Find Best Fitting Distribution
### Aliases: find_best_fit

### ** Examples

petal.length <- datasets::iris$Petal.Length[datasets::iris$Species == "setosa"]
simukde::find_best_fit(x = petal.length, positive = TRUE)



