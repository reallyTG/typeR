library(compboost)


### Name: Compboost
### Title: Compboost API
### Aliases: Compboost

### ** Examples

cboost = Compboost$new(mtcars, "mpg", loss = LossQuadratic$new())
cboost$addBaselearner("hp", "spline", BaselearnerPSpline, degree = 3,
  n.knots = 10, penalty = 2, differences = 2)
cboost$train(1000)

table(cboost$getSelectedBaselearner())
cboost$plot("hp_spline")



