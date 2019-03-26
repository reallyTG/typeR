library(hqreg)


### Name: plot.hqreg
### Title: Plot coefficients from a "hqreg" object
### Aliases: plot.hqreg
### Keywords: models regression

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
beta = rnorm(10)
eps = 4*rnorm(1000)
y = drop(X[,1:10] %*% beta + eps) 
fit = hqreg(X, y)
par(mfrow = c(2,2))
plot(fit)
plot(fit, nvars = FALSE, alpha = 0.5)
plot(fit, xvar = "norm")



