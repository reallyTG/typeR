library(nlme)


### Name: fdHess
### Title: Finite difference Hessian
### Aliases: fdHess
### Keywords: models

### ** Examples

(fdH <- fdHess(c(12.3, 2.34), function(x) x[1]*(1-exp(-0.4*x[2]))))
stopifnot(length(fdH$ mean) == 1,
          length(fdH$ gradient) == 2,
          identical(dim(fdH$ Hessian), c(2L, 2L)))



