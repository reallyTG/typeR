library(lmomco)


### Name: pdfexp
### Title: Probability Density Function of the Exponential Distribution
### Aliases: pdfexp
### Keywords: distribution probability density function Distribution:
###   Exponential

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  expp <- parexp(lmr)
  x <- quaexp(.5,expp)
  pdfexp(x,expp)



