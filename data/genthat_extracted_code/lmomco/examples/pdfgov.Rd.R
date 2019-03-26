library(lmomco)


### Name: pdfgov
### Title: Probability Density Function of the Govindarajulu Distribution
### Aliases: pdfgov
### Keywords: distribution probability density function Distribution:
###   Govindarajulu

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  gov <- pargov(lmr)
  x <- quagov(0.5,gov)
  pdfgov(x,gov)



