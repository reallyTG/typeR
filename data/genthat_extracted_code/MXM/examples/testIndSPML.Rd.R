library(MXM)


### Name: Conditional independence test for circular data
### Title: Circular regression conditional independence test for circular
###   class dependent variables and continuous predictors.
### Aliases: testIndSPML
### Keywords: Beta regression Conditional independence test

### ** Examples

y <- runif(100, - pi, pi)  ## suppose these are radians
x <- matrix( rnorm(100 * 3), ncol = 3)
testIndSPML(y1, x, csIndex = 1, xIndex = 2)
## alternatively
y1 <- cbind(cos(y), sin(y)) ## a matrix with two columns
testIndSPML(y1, x, csIndex = 1, xIndex = 2)



