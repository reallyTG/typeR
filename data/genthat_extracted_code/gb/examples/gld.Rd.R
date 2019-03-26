library(gb)


### Name: drsgld
### Title: Basic functions for RS-GLD
### Aliases: drsgld prsgld qrsgld rrsgld gld
### Keywords: stats

### ** Examples


lambdas = c(0, 0.1975, 0.1349,0.1349)
qrsgld(c(0,.1,.5,.7,1),lambdas)
prsgld(c(-10,0,1,3,20),lambdas)
drsgld(c(-10,0,1,3,20),lambdas)
x = sort(rrsgld(100,lambdas))
plot(dnorm(x)~x,type='l')
lines(drsgld(x,lambdas)~x,lty=2,col=2)
lines(density(x),col=4,lty=3)




