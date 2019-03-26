library(car)


### Name: boxCox
### Title: Graph the profile log-likelihood for Box-Cox transformations in
###   1D, or in 2D with the bcnPower family.
### Aliases: boxCox boxCox2d boxCox.lm boxCox.default boxCox.formula
###   boxCox.bcnPowerTransform
### Keywords: regression

### ** Examples

  with(trees, boxCox(Volume ~ log(Height) + log(Girth), data = trees,
         lambda = seq(-0.25, 0.25, length = 10)))

  data("quine", package = "MASS")
  with(quine, boxCox(Days ~ Eth*Sex*Age*Lrn, 
         lambda = seq(-0.05, 0.45, len = 20), family="yjPower"))



