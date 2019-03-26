library(deldir)


### Name: print.tileInfo
### Title: Print a summary of tile information.
### Aliases: print.tileInfo
### Keywords: utilities

### ** Examples

set.seed(179)
x    <- runif(100)
y    <- runif(100)
dxy  <- deldir(x,y,rw=c(0,1,0,1))
ixy1 <- tileInfo(dxy)
print(ixy1)
ixy2 <- tileInfo(dxy,bndry=TRUE)
print(ixy2)



