library(compboost)


### Name: boostLinear
### Title: Wrapper to boost linear models for each feature.
### Aliases: boostLinear

### ** Examples

mod = boostLinear(data = iris, target = "Sepal.Length", loss = LossQuadratic$new())
mod$getBaselearnerNames()
mod$getEstimatedCoef()
table(mod$getSelectedBaselearner())
mod$predict()
mod$plot("Sepal.Width_linear")



