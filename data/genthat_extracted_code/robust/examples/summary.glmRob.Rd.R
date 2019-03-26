library(robust)


### Name: summary.glmRob
### Title: Summarizing Robust Generalized Linear Model Fits
### Aliases: summary.glmRob
### Keywords: methods robust regression

### ** Examples

data(breslow.dat)
bres.rob <- glmRob(sumY ~ Age10 + Base4*Trt, family = poisson(), data = breslow.dat)
bres.sum <- summary(bres.rob)
bres.sum



