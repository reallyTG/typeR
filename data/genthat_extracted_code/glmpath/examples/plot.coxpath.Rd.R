library(glmpath)


### Name: plot.coxpath
### Title: Plots the regularization path computed from coxpath
### Aliases: plot.coxpath
### Keywords: models regression

### ** Examples

data(lung.data)
attach(lung.data)
fit <- coxpath(lung.data)
par(mfrow=c(3, 2))
plot(fit)
plot(fit, xvar="lambda")
plot(fit, xvar="step")
plot(fit, xvar="step", xlimit=8)
plot(fit, type="aic")
plot(fit, type="bic")
detach(lung.data)



