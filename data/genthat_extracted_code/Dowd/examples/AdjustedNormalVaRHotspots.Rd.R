library(Dowd)


### Name: AdjustedNormalVaRHotspots
### Title: Hotspots for VaR adjusted by Cornish-Fisher correction
### Aliases: AdjustedNormalVaRHotspots

### ** Examples

# Hotspots for ES for randomly generated portfolio
   vc.matrix <- matrix(rnorm(16),4,4)
   mu <- rnorm(4)
   skew <- .5
   kurtosis <- 1.2
   positions <- c(5,2,6,10)
   cl <- .95
   hp <- 280
   AdjustedNormalVaRHotspots(vc.matrix, mu, skew, kurtosis, positions, cl, hp)



