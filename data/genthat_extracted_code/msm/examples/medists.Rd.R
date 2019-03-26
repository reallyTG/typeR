library(msm)


### Name: medists
### Title: Measurement error distributions
### Aliases: medists dmenorm pmenorm qmenorm rmenorm dmeunif pmeunif
###   qmeunif rmeunif
### Keywords: distribution

### ** Examples

## what does the distribution look like?
x <- seq(50, 90, by=1)
plot(x, dnorm(x, 70, 10), type="l", ylim=c(0,0.06)) ## standard Normal
lines(x, dtnorm(x, 70, 10, 60, 80), type="l")       ## truncated Normal
## truncated Normal with small measurement error
lines(x, dmenorm(x, 70, 10, 60, 80, sderr=3), type="l")



