library(mable)


### Name: plotmable
### Title: Plot Maximum Approximate Bernstein Likelihood Estimates of f or
###   F
### Aliases: plotmable
### Keywords: ~distribution ~models ~nonparametric ~smooth

### ** Examples

## No test: 
# standard normal
a<--4; b<-4;
x<-rnorm(30)
bfit<-mable.em(x, m=20, a, b)
# density estimate
plot(xx<-seq(a,b,len=512), dnorm(xx), type="l", xlab="x", ylab="f(x)")
plotmable(bfit, lty=2,col=2)
# cdf estimate
plot(xx<-seq(a,b,len=512), pnorm(xx), type="l", xlab="x", ylab="F(x)")
plotmable(bfit, density=FALSE, lty=2,col=2)
## End(No test)



