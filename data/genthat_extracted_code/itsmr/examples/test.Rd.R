library(itsmr)


### Name: test
### Title: Test residuals for stationarity and randomness
### Aliases: test

### ** Examples

M = c("log","season",12,"trend",1)
e = Resid(wine,M)
test(e) ## Is e stationary?
a = arma(e,1,1)
ee = Resid(wine,M,a)
test(ee) ## Is ee white noise?



