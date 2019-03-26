library(spatstat)


### Name: plot.slrm
### Title: Plot a Fitted Spatial Logistic Regression
### Aliases: plot.slrm
### Keywords: spatial hplot models

### ** Examples

   data(copper)
   X <- copper$SouthPoints
   Y <- copper$SouthLines
   Z <- distmap(Y)
   fit <- slrm(X ~ Z)
   plot(fit)
   plot(fit, type="link")



