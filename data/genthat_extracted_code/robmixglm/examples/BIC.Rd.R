library(robmixglm)


### Name: BIC
### Title: BIC for robmixglm object
### Aliases: BIC.robmixglm
### Keywords: methods

### ** Examples

library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(bp~pres,data=forbes)
BIC(forbes.robustmix)



