library(deldir)


### Name: which.tile
### Title: Determine the tile containing a given point.
### Aliases: which.tile
### Keywords: spatial

### ** Examples

set.seed(42)
x   <- runif(20,0,100)
y   <- runif(20,0,100)
dxy <- deldir(x,y)
txy <- tile.list(dxy)
i   <- which.tile(30,50,txy) # The value of i here is 14.
plot(txy,showpoints=FALSE)
text(x,y,labels=1:length(txy),col="red")
points(30,50,pch=20,col="blue")



