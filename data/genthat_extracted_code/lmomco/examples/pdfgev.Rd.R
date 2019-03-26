library(lmomco)


### Name: pdfgev
### Title: Probability Density Function of the Generalized Extreme Value
###   Distribution
### Aliases: pdfgev
### Keywords: distribution probability density function Distribution:
###   Generalized Extreme Value

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  gev <- pargev(lmr)
  x <- quagev(0.5,gev)
  pdfgev(x,gev)



