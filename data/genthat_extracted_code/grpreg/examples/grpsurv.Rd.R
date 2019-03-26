library(grpreg)


### Name: grpsurv
### Title: Fit an group penalized survival model
### Aliases: grpsurv

### ** Examples

data(Lung)
X <- Lung$X
y <- Lung$y
group <- Lung$group

fit <- grpsurv(X, y, group)
plot(fit)

S <- predict(fit, X, type='survival', lambda=0.05)
plot(S, xlim=c(0,200))



