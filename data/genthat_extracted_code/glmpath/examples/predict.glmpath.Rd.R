library(glmpath)


### Name: predict.glmpath
### Title: Makes predictions at particular points along the fitted glmpath
### Aliases: predict.glmpath
### Keywords: models regression

### ** Examples

data(heart.data)
attach(heart.data)
fit <- glmpath(x, y, family=binomial)
pred <- predict(fit, x, s = seq(0, 1, length=10), mode="norm.fraction")
detach(heart.data)



