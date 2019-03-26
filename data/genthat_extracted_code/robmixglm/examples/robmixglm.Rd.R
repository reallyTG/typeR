library(robmixglm)


### Name: robmixglm
### Title: Fits a Robust Generalized Linear Model and Variants
### Aliases: robmixglm
### Keywords: multivariate

### ** Examples

library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(100*log10(pres)~bp,data=forbes)



