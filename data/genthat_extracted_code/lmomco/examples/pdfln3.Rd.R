library(lmomco)


### Name: pdfln3
### Title: Probability Density Function of the 3-Parameter Log-Normal
###   Distribution
### Aliases: pdfln3
### Keywords: distribution probability density function Distribution:
###   Log-Normal (3-parameter)

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  ln3 <- parln3(lmr); gno <- pargno(lmr)
  x <- qualn3(0.5,ln3)
  pdfln3(x,ln3) # 0.008053616
  pdfgno(x,gno) # 0.008053616 (the distributions are the same, but see Note)



