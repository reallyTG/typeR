library(Directional)


### Name: Cross validation with ESAG discrminant analysis
### Title: Cross validation for estimating the classification rate of a
###   discrminant analysis for directional data assuming an ESAG
###   distribution
### Aliases: ESAG.da
### Keywords: Discriminant analysis Cross validation von Mises-Fisher
###   distribution

### ** Examples

x <- rvmf(100, rnorm(3), 15)
ina <- rep(1:2, each = 50)
ESAG.da(x, ina, fraction = 0.2, R = 50, seed = FALSE)



