library(caschrono)


### Name: plotacfthemp
### Title: Plots the ACF and PACF of a theoretical ARMA model and the
###   empirical ACF and PACF of an observed series
### Aliases: plotacfthemp
### Keywords: ts

### ** Examples

set.seed(951)
ya <- arima.sim(n=200, list(ma = c(-0.3, 0.6)), 
sd = sqrt(1.5))
plotacfthemp(ya, ma=c(-0.3,0.6), titre="MA(2)") 



