library(arfima)


### Name: sim_from_fitted
### Title: Simulate an ARFIMA time series from a fitted arfima object.
### Aliases: sim_from_fitted
### Keywords: fit ts

### ** Examples


set.seed(6533)
sim <- arfima.sim(1000, model = list(phi = .2, dfrac = .3, dint = 2))

fit <- arfima(sim, order = c(1, 2, 0))
fit

sim2 <- sim_from_fitted(100, fit)

fit2 <- arfima(sim2, order = c(1, 2, 0))
fit2

## No test: 
set.seed(2266)
#Fairly pathological series to fit for this package
series = arfima.sim(500, model=list(phi = 0.98, dfrac = 0.46))

X = matrix(rnorm(1000), ncol = 2)
colnames(X) <- c('c1', 'c2')
series_added <- series + X%*%c(2, 5)

fit <- arfima(series, order = c(1, 0, 0), numeach = c(2, 2))
fit_X <- arfima(series_added, order=c(1, 0, 0), xreg=X, numeach = c(2, 2))

from_series <- sim_from_fitted(1000, fit)
 
fit1a <- arfima(from_series[[1]], order = c(1, 0, 0), numeach = c(2, 2))
fit1a
fit1 <- arfima(from_series[[1]], order = c(1, 0, 0))
fit1
fit2 <- arfima(from_series[[1]], order = c(1, 0, 0))
fit2
fit3 <- arfima(from_series[[1]], order = c(1, 0, 0))
fit3
fit4 <- arfima(from_series[[1]], order = c(1, 0, 0))
fit4

Xnew = matrix(rnorm(2000), ncol = 2)
from_series_X <- sim_from_fitted(1000, fit_X, X=Xnew)

fit_X1a <- arfima(from_series_X[[1]], order=c(1, 0, 0), xreg=Xnew, numeach = c(2, 2))
fit_X1a
fit_X1 <- arfima(from_series_X[[1]], order=c(1, 0, 0), xreg=Xnew)
fit_X1
fit_X2 <- arfima(from_series_X[[2]], order=c(1, 0, 0), xreg=Xnew)
fit_X2
fit_X3 <- arfima(from_series_X[[3]], order=c(1, 0, 0), xreg=Xnew)
fit_X3
fit_X4 <- arfima(from_series_X[[4]], order=c(1, 0, 0), xreg=Xnew)
fit_X4
## End(No test)



