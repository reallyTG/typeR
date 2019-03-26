library(lmomco)


### Name: pdfgpa
### Title: Probability Density Function of the Generalized Pareto
###   Distribution
### Aliases: pdfgpa
### Keywords: distribution probability density function Distribution:
###   Generalized Pareto

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  gpa <- pargpa(lmr)
  x <- quagpa(0.5,gpa)
  pdfgpa(x,gpa)



