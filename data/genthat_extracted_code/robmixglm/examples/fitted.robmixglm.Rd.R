library(robmixglm)


### Name: fitted.robmixglm
### Title: Fitted values.
### Aliases: fitted.robmixglm
### Keywords: method

### ** Examples

library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(bp~pres,data=forbes)
BIC(forbes.robustmix)
plot(fitted(forbes.robustmix),residuals(forbes.robustmix))



