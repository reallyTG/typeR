library(glmpath)


### Name: plot.glmpath
### Title: Plots the regularization path computed from glmpath
### Aliases: plot.glmpath
### Keywords: models regression

### ** Examples

data(heart.data)
attach(heart.data)
fit <- glmpath(x, y, family=binomial)
par(mfrow=c(3, 2))
plot(fit)
plot(fit, xvar="lambda")
plot(fit, xvar="step")
plot(fit, xvar="step", xlimit=8)
plot(fit, type="aic")
plot(fit, type="bic")
detach(heart.data)



