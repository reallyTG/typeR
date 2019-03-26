library(gamlss.dist)


### Name: gamlss.dist-package
### Title: Distributions for Generalized Additive Models for Location Scale
###   and Shape
### Aliases: gamlss.dist-package gamlss.dist
### Keywords: package

### ** Examples

# pdf plot
plot(function(y) dSICHEL(y, mu=10, sigma = 0.1 , nu=1 ), 
              from=0, to=30, n=30+1, type="h")
# cdf plot
PPP <- par(mfrow=c(2,1))
plot(function(y) pSICHEL(y, mu=10, sigma =0.1, nu=1 ), 
             from=0, to=30, n=30+1, type="h") # cdf
cdf<-pSICHEL(0:30, mu=10, sigma=0.1, nu=1) 
sfun1  <- stepfun(1:30, cdf, f = 0)
plot(sfun1, xlim=c(0,30), main="cdf(x)")
par(PPP)



