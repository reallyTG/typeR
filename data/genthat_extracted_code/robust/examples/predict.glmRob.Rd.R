library(robust)


### Name: predict.glmRob
### Title: Predict Method for Robust Generalized Linear Model Fits
### Aliases: predict.glmRob
### Keywords: robust regression methods

### ** Examples

data(breslow.dat)
bres.rob <- glmRob(sumY ~ Age10 + Base4 * Trt, family = poisson(), data = breslow.dat)
predict(bres.rob)



