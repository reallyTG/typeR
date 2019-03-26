library(lmomco)


### Name: cdfkur
### Title: Cumulative Distribution Function of the Kumaraswamy Distribution
### Aliases: cdfkur
### Keywords: distribution cumulative distribution function Distribution:
###   Kumaraswamy

### ** Examples

  lmr <- lmoms(c(0.25, 0.4, 0.6, 0.65, 0.67, 0.9))
  cdfkur(0.5,parkur(lmr))



