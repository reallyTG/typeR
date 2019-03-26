library(tsoutliers)


### Name: coefs2poly
### Title: Product of the Polynomials in an ARIMA Model
### Aliases: coefs2poly
### Keywords: ts, math, symbolmath

### ** Examples

# ARIMA(0,1,1)(0,1,1) model
fit <- arima(log(AirPassengers), order = c(0,1,1), 
  seasonal = list(order = c(0,1,1)))
coefs <- coef(fit)

# "coefs2poly" returns the coefficients of the product of 
# the non-seasonal and the seasonal moving average polynomials
a1 <- convolve(c(1, coefs[1]), rev(c(1, rep(0, 11), coefs[2])), type="open")[-1]
a2 <- coefs2poly(fit)$macoefs
a2
all.equal(a1, a2, check.names=FALSE)

# since the model does not contain an autoregressive part
# the product of the regular and the seasonal differencing 
# filter is returned if "add = TRUE"
coefs2poly(fit)$arcoefs
# an empty set is returned if "add = FALSE"
coefs2poly(fit, add = FALSE)$arcoefs

# in a model with non-seasonal part and no differencing filter 
# no multiplication of polynomials are involved and 
# the coefficients are the same as those returned by "coef"
fit <- arima(log(AirPassengers), order = c(1,0,1))
coef(fit)
coefs2poly(fit)



