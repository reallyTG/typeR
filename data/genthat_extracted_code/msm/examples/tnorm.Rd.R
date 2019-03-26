library(msm)


### Name: tnorm
### Title: Truncated Normal distribution
### Aliases: tnorm dtnorm ptnorm qtnorm rtnorm
### Keywords: distribution

### ** Examples

x <- seq(50, 90, by=1)
plot(x, dnorm(x, 70, 10), type="l", ylim=c(0,0.06)) ## standard Normal distribution
lines(x, dtnorm(x, 70, 10, 60, 80), type="l")       ## truncated Normal distribution



