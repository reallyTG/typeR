library(lmomco)


### Name: pdfgum
### Title: Probability Density Function of the Gumbel Distribution
### Aliases: pdfgum
### Keywords: distribution probability density function Distribution:
###   Gumbel

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  gum <- pargum(lmr)
  x <- quagum(0.5,gum)
  pdfgum(x,gum)



