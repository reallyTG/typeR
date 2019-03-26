library(Dowd)


### Name: NormalESHotspots
### Title: Hotspots for normal ES
### Aliases: NormalESHotspots

### ** Examples

# Hotspots for ES for randomly generated portfolio
   vc.matrix <- matrix(rnorm(16),4,4)
   mu <- rnorm(4,.08,.04)
   positions <- c(5,2,6,10)
   cl <- .95
   hp <- 280
   NormalESHotspots(vc.matrix, mu, positions, cl, hp)



