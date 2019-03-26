library(lmomco)


### Name: pdfgno
### Title: Probability Density Function of the Generalized Normal
###   Distribution
### Aliases: pdfgno
### Keywords: distribution probability density function Distribution:
###   Generalized Normal

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  gno <- pargno(lmr)
  x <- quagno(0.5,gno)
  pdfgno(x,gno)



