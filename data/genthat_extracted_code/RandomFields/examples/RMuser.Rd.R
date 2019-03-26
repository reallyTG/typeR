library(RandomFields)


### Name: RMuser
### Title: User-Defined Function
### Aliases: RMuser RM_USER
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Alternatively to 'model <- RMexp()' one may define the following
## (which is, however, much slower and cannot use all features of
## RandomFields)
## Don't show: 
if (RFoptions()$general$storing) {
  cat("This examples requires 'RFoptions(storing=FALSE)', what is set now.\n");
  RFoptions(storing=FALSE)
}
## End(Don't show)
## user-defined exponential covariance model
model <- RMuser(type="positive definite", domain="single variable",
                iso="isotropic", fctn=exp(-x))
x <- y <- seq(1, 10, len=100)
plot(model)
z <- RFsimulate(model, x=x, y=y)
plot(z)

## the kernel, which is the scalar product (see RMprod)
model <- RMnugget(var=1e-5) +
         RMuser(type="positive definite", domain="kernel",
                iso="symmetric", fctn=sum(x * y))
x <- y <- seq(1, 10, len=35)
z <- RFsimulate(model, x=x, y=y, n=6, svdtol=1e-9) 
plot(z)
## Don't show: 
FinalizeExample()
## End(Don't show)


