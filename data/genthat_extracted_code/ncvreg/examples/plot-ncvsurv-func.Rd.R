library(ncvreg)


### Name: plot.ncvsurv.func
### Title: Plot survival curve for ncvsurv model
### Aliases: plot.ncvsurv.func

### ** Examples

data(Lung)
X <- Lung$X
y <- Lung$y

fit <- ncvsurv(X, y)

# A single survival curve
S <- predict(fit, X[1,], type='survival', lambda=.15)
plot(S, xlim=c(0,200))

# Lots of survival curves
S <- predict(fit, X, type='survival', lambda=.08)
plot(S, xlim=c(0,200), alpha=0.3)



