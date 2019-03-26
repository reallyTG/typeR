library(cgam)


### Name: in.or.out
### Title: To Include a Non-Parametrically Modelled Predictor in a
###   SHAPESELECT Formula
### Aliases: in.or.out
### Keywords: variable selection routine

### ** Examples

## Not run: 
##D   n <- 100
##D   # x is a continuous predictor 
##D   x <- runif(n)
##D   
##D   # generate z and to include it as a categorical predictor
##D   z <- rep(0:1, 50)
##D 
##D   # y is generated as correlated to both x and z
##D   # the relationship between y and x is smoothly increasing-convex
##D   y <- x^2 + 2 * I(z == 1) + rnorm(n, sd = 1)
##D 
##D   # call ShapeSelect to find the best model by the genetic algorithm
##D   # factor(z) may be in or out of the model  
##D   fit <- ShapeSelect(y ~ shapes(x) + in.or.out(factor(z)), genetic = TRUE)
##D 
##D   # factor(z) isn't chosen and is included in the model
##D   fit <- ShapeSelect(y ~ shapes(x) + factor(z), genetic = TRUE)
## End(Not run)



