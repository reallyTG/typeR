library(deldir)


### Name: tileInfo
### Title: Extract information from a tile list.
### Aliases: tileInfo
### Keywords: spatial

### ** Examples

set.seed(42)
x    <- runif(20)
y    <- runif(20)
dxy  <- deldir(x,y,rw=c(0,1,0,1))
ixy1 <- tileInfo(dxy)
ixy2 <- tileInfo(dxy,bndry=TRUE)



