library(distrMod)


### Name: Confint-class
### Title: Confint-class
### Aliases: Confint-class type,Confint-method call.estimate
###   call.estimate,Confint-method confint,Confint,missing-method
###   name.estimate name.estimate,Confint-method trafo.estimate
###   trafo.estimate,Confint-method samplesize.estimate
###   samplesize.estimate,Confint-method completecases.estimate
###   completecases.estimate,Confint-method nuisance.estimate
###   nuisance.estimate,Confint-method fixed.estimate
###   fixed.estimate,Confint-method show,Confint-method
###   print,Confint-method
### Keywords: classes

### ** Examples

## some transformation
mtrafo <- function(x){
     nms0 <- c("scale","shape")
     nms <- c("shape","rate")
     fval0 <- c(x[2], 1/x[1])
     names(fval0) <- nms
     mat0 <- matrix( c(0, -1/x[1]^2, 1, 0), nrow = 2, ncol = 2,
                     dimnames = list(nms,nms0))                          
     list(fval = fval0, mat = mat0)}

x <- rgamma(50, scale = 0.5, shape = 3)

## parametric family of probability measures
G <- GammaFamily(scale = 1, shape = 2, trafo = mtrafo)
## MLE
res <- MLEstimator(x = x, ParamFamily = G)
ci <- confint(res)
print(ci, digits = 4, show.details="maximal")
print(ci, digits = 4, show.details="medium")
print(ci, digits = 4, show.details="minimal")



