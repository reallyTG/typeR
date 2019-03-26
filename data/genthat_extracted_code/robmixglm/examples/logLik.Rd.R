library(robmixglm)


### Name: logLik
### Title: log Likelikelihood for robmixglm object
### Aliases: logLik.robmixglm
### Keywords: methods

### ** Examples

library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(bp~pres,data=forbes)
logLik(forbes.robustmix)



