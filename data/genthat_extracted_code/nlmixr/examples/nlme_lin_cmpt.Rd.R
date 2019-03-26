library(nlmixr)


### Name: nlme_lin_cmpt
### Title: Fit nlme-based linear compartment mixed-effect model using
###   closed form solution
### Aliases: nlme_lin_cmpt nlmeLinCmpt nlmeLinCmt

### ** Examples

library(nlmixr)

specs <- list(fixed=lKA+lCL+lV~1, random = pdDiag(lKA+lCL~1), start=c(lKA=0.5, lCL=-3.2, lV=-1))
fit <- nlme_lin_cmpt(theo_md, par_model=specs, ncmt=1, verbose=TRUE)
#plot(augPred(fit,level=0:1))
summary(fit)




