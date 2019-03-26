library(robmixglm)


### Name: coef
### Title: Coefficients for a robmixglm object
### Aliases: coef coef.robmixglm
### Keywords: methods

### ** Examples

library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(bp~pres,data=forbes)
coef(forbes.robustmix)



