library(caschrono)


### Name: plot2acf
### Title: ACF plots of two series
### Aliases: plot2acf
### Keywords: ts

### ** Examples

data(nottem)
set.seed(2561)
innov1 = rnorm(290,sd=4.18)
y  = arima.sim(list(order = c(12,0,1), ma=-.7, ar=c(rep(0,11),.9)), 
innov =innov1, n.start =50, n = 240) + 50
plot2acf(nottem, y, main=c("ACF nottem","ACF SAR"))



