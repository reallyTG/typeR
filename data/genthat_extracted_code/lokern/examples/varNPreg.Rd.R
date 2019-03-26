library(lokern)


### Name: varNPreg
### Title: Nonparametric Variance Estimator
### Aliases: varNPreg varest
### Keywords: nonparametric regression

### ** Examples

 x <- sort(runif(100))
 y <- sin(pi*x) + rnorm(100)/10
 str(ve <- varNPreg(x,y))



