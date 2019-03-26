library(robmixglm)


### Name: AIC
### Title: AIC for robmixglm object
### Aliases: AIC.robmixglm
### Keywords: methods

### ** Examples

library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(bp~pres,data=forbes)
AIC(forbes.robustmix)



