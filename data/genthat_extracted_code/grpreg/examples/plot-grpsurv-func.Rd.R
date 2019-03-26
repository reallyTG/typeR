library(grpreg)


### Name: plot.grpsurv.func
### Title: Plot survival curve for grpsurv model
### Aliases: plot.grpsurv.func

### ** Examples

data(Lung)
X <- Lung$X
y <- Lung$y
group <- Lung$group
fit <- grpsurv(X, y, group)

# A single survival curve
S <- predict(fit, X[1,], type='survival', lambda=.05)
plot(S, xlim=c(0,200))

# Lots of survival curves
S <- predict(fit, X, type='survival', lambda=.05)
plot(S, xlim=c(0,200), alpha=0.3)



