library(MASS)


### Name: predict.glmmPQL
### Title: Predict Method for glmmPQL Fits
### Aliases: predict.glmmPQL
### Keywords: models

### ** Examples

fit <- glmmPQL(y ~ trt + I(week > 2), random = ~1 |  ID,
               family = binomial, data = bacteria)
predict(fit, bacteria, level = 0, type="response")
predict(fit, bacteria, level = 1, type="response")



