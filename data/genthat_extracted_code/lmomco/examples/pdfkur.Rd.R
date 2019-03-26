library(lmomco)


### Name: pdfkur
### Title: Probability Density Function of the Kumaraswamy Distribution
### Aliases: pdfkur
### Keywords: distribution probability density function Distribution:
###   Kumaraswamy

### ** Examples

  lmr <- lmoms(c(0.25, 0.4, 0.6, 0.65, 0.67, 0.9))
  kur <- parkur(lmr)
  x <- quakur(0.5,kur)
  pdfkur(x,kur)



