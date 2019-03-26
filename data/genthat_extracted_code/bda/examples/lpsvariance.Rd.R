library(bda)


### Name: lps.variance
### Title: compute the variance of the local polynomial regression function
### Aliases: lps.variance
### Keywords: smooth

### ** Examples


n = 100
x=rnorm(n)
y=x^2+rnorm(n)
bw = lps.variance
par(mfrow=c(1,1))
out=lpsmooth(y,x)
#plot(out, scb=TRUE, type='l')
vrx = lps.variance(y,x)
out=lpsmooth(y,x,sd.y=sqrt(vrx), bw=0.5)
plot(y~x, pch='.')
lines(out, scb=TRUE, col=2)

x0 = seq(min(x),  max(x), length=100)
y0 = x0^2
lines(y0~x0, col=4)

 


