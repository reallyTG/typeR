library(lmomco)


### Name: pdfglo
### Title: Probability Density Function of the Generalized Logistic
###   Distribution
### Aliases: pdfglo
### Keywords: distribution probability density function Distribution:
###   Generalized Logistic

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  glo <- parglo(lmr)
  x <- quaglo(0.5,glo)
  pdfglo(x,glo)



