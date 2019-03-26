library(compboost)


### Name: boostSplines
### Title: Wrapper to boost p spline models for each feature.
### Aliases: boostSplines

### ** Examples

mod = boostSplines(data = iris, target = "Sepal.Length", loss = LossQuadratic$new())
mod$getBaselearnerNames()
mod$getEstimatedCoef()
table(mod$getSelectedBaselearner())
mod$predict()
mod$plot("Sepal.Width_spline")



