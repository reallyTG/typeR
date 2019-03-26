library(lmomco)


### Name: pdflap
### Title: Probability Density Function of the Laplace Distribution
### Aliases: pdflap
### Keywords: distribution probability density function Distribution:
###   Laplace

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  lap <- parlap(lmr)
  x <- qualap(0.5,lap)
  pdflap(x,lap)



