library(lpridge)


### Name: lpepa
### Title: Local polynomial regression fitting with Epanechnikov weights
### Aliases: lpepa
### Keywords: smooth

### ** Examples

data(cars)
attach(cars)

epa.sd <- lpepa(speed,dist, bandw=5)		# local polynomials

plot(speed, dist, main = "data(cars) & lp epanechnikov regression")
lines(epa.sd$x.out, epa.sd$est,  col="red")
lines(lowess(speed,dist, f= .5), col="orange")
detach()



