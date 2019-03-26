library(tsdecomp)


### Name: polyeval
### Title: Polynomial Operations and Utilities
### Aliases: polydiv polyeval polyprod polystring roots2poly
### Keywords: ts

### ** Examples

# print a fitted ARMA model
set.seed(123)
y <- arima.sim(n=120, model=list(ar=c(0.8, -0.3), ma=0.6))
fit <- arima(y, order=c(2,0,1), include.mean=FALSE)
cat(paste0(
polystring(c(1, -fit$model$phi), brackets=TRUE, ndec=3), "y_t = ",
polystring(c(1, fit$model$theta), brackets=TRUE, ndec=3), "e_t\n"))

# convert roots to coefficients
p <- c(1, 0.8, -0.3)
cat(polystring(p))
r <- polyroot(p)
roots2poly(r)



