library(xspliner)


### Name: xspline
### Title: Builds predictive model based GLM.
### Aliases: xspline model_surrogate_xspliner xspline.default
###   xspline.formula xspline.explainer

### ** Examples

# preparing blackbox model
library(randomForest)
rf_iris <- randomForest(
  Petal.Width ~  Sepal.Length + Petal.Length + Species,
  data = iris)

# formula based xspliner
xs_iris <- xspline(
  Petal.Width ~ xs(Sepal.Length) + xs(Petal.Length) + xf(Species),
  model = rf_iris)
summary(xs_iris)
plot(xs_iris, "Sepal.Length")

# passing just the model
xs_iris <- xspline(rf_iris)
summary(xs_iris)
plot(xs_iris, "Sepal.Length")

# using DALEX
library(DALEX)
xs_iris_explainer <- explain(rf_iris)
xs_iris <- xspline(rf_iris)
summary(xs_iris)
plot(xs_iris, "Sepal.Length")




