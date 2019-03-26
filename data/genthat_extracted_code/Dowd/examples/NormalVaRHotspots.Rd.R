library(Dowd)


### Name: NormalVaRHotspots
### Title: Hotspots for normal VaR
### Aliases: NormalVaRHotspots

### ** Examples

# Hotspots for ES for randomly generated portfolio
   vc.matrix <- matrix(rnorm(16),4,4)
   mu <- rnorm(4,.08,.04)
   positions <- c(5,2,6,10)
   cl <- .95
   hp <- 280
   NormalVaRHotspots(vc.matrix, mu, positions, cl, hp)



