library(spatstat)


### Name: distfun.lpp
### Title: Distance Map on Linear Network
### Aliases: distfun.lpp
### Keywords: spatial math

### ** Examples

   data(letterR)
   X <- runiflpp(3, simplenet)
   f <- distfun(X)
   f
   plot(f)

   # using a distfun as a covariate in a point process model:
   Y <- runiflpp(4, simplenet)
   fit <- lppm(Y ~D, covariates=list(D=f))

   f(Y)



