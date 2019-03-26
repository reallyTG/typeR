library(lmomco)


### Name: pdftri
### Title: Probability Density Function of the Asymmetric Triangular
###   Distribution
### Aliases: pdftri
### Keywords: distribution probability density function Distribution:
###   Asymmetric Triangular Distribution: Triangular

### ** Examples

  tri <- vec2par(c(-120, 102, 320), type="tri")
  x <- quatri(nonexceeds(),tri)
  pdftri(x,tri)



