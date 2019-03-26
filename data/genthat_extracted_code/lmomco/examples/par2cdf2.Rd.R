library(lmomco)


### Name: par2cdf2
### Title: Equivalent Cumulative Distribution Function of Two Distributions
### Aliases: par2cdf2
### Keywords: distribution (mixture) distribution (mixture) mixed
###   distribution

### ** Examples

lmr <- lmoms(rnorm(20)); left <- parnor(lmr); right <- pargev(lmr)
mixed.median    <- par2qua2(0.5,          left, right)
mixed.nonexceed <- par2cdf2(mixed.median, left, right)



