library(multitaper)


### Name: multitaperTrend
### Title: Estimate Linear Trend using Multitaper Techniques
### Aliases: multitaperTrend
### Keywords: math

### ** Examples

x <- 1:101
y <- 1.0 + 0.5*(x) + rnorm(n=101,mean=0,sd=2)
vars <- multitaperTrend(xd=y, B=0.05, deltat=1.0, t.in=x)
plot(x,y,type="l")
lines(x,vars[[1]]+vars[[2]]*vars[[3]],type="l",col="red")



