library(forecastSNSTS)


### Name: measure-of-accuracy
### Title: Mean squared or absolute h-step ahead prediction errors
### Aliases: measure-of-accuracy MSPE measure-of-accuracy MAPE

### ** Examples

T <- 1000
X <- rnorm(T)
P <- 5
H <- 1
m <- 20
Nmin <- 20
pcoef <- predCoef(X, P, H, (T - m - H + 1):T, c(0, seq(Nmin, T - m - H, 1)))

mspe <- MSPE(X, pcoef, 991, 1000, 3, 1, c(0, Nmin:(T-m-H)))

plot(mspe, vr = 1, Nmin = Nmin)



