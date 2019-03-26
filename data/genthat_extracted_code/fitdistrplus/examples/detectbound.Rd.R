library(fitdistrplus)


### Name: detectbound
### Title: Detect bounds for density function
### Aliases: detectbound
### Keywords: distribution

### ** Examples


#case where the density returns a Not-an-Numeric value.
detectbound("exp", c(rate=3), 1:10)
detectbound("binom", c(size=3, prob=1/2), 1:10)
detectbound("nbinom", c(size=3, prob=1/2), 1:10)





