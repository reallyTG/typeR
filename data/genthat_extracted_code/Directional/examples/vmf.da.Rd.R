library(Directional)


### Name: Cross validation in von Mises-Fisher discrminant analysis
### Title: Cross validation for estimating the classification rate of a
###   discrminant analysis for directional data assuming a von Mises-Fisher
###   distribution
### Aliases: vmf.da
### Keywords: Discriminant analysis Cross validation von Mises-Fisher
###   distribution

### ** Examples

x <- rvmf(100, rnorm(4), 15)
ina <- rep(1:2, each = 50)
vmf.da(x, ina, fraction = 0.2, R = 200, seed = FALSE)



