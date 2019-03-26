library(glmpath)


### Name: predict.coxpath
### Title: Makes predictions at particular points along the fitted coxpath
### Aliases: predict.coxpath
### Keywords: models regression

### ** Examples

data(lung.data)
attach(lung.data)
fit <- coxpath(lung.data)
pred.a <- predict(fit, x, s = seq(0, 1, length=10),
                  mode = "norm.fraction")
library(survival)
pred.b <- predict(fit, lung.data, s = 0.5, type = "coxph",
                  mode = "lambda.fraction")
pred.s <- survfit(pred.b)
plot(pred.s)
detach(lung.data)



