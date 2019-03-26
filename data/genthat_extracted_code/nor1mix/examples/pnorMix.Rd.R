library(nor1mix)


### Name: pnorMix
### Title: Normal Mixture Cumulative Distribution and Quantiles
### Aliases: pnorMix qnorMix
### Keywords: distribution

### ** Examples

MW.nm3 # the "strange skew" one
plot(MW.nm3)
## now the cumlative :
x <- seq(-4,4, length=1001)
plot(x, pnorMix(x, MW.nm3), type="l", col=2)
## and some of its inverse :
pp <- seq(.1, .9, by=.1)
plot(qnorMix(pp, MW.nm3), pp)

## The "true" median of a normal mixture:
median.norMix <- function(x) qnorMix(1/2, x)
median.norMix(MW.nm3) ## -2.32



