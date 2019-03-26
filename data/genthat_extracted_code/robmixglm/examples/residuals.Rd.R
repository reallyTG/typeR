library(robmixglm)


### Name: residuals.robmixglm
### Title: Extract Model Residuals
### Aliases: residuals.robmixglm
### Keywords: models

### ** Examples

library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(bp~pres,data=forbes)
BIC(forbes.robustmix)
plot(fitted(forbes.robustmix),residuals(forbes.robustmix))



