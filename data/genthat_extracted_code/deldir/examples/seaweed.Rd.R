library(deldir)


### Name: seaweed
### Title: seaweed
### Aliases: seaweed
### Keywords: datasets

### ** Examples

# data(seaweed)
# It is unnecessary to use \code{data} since \code{seaweed} is
# a "first class object".  It is "lazily loaded".

dsw <- deldir(seaweed)
isw <- tileInfo(dsw)
options(width=120)
# Expand the width of the terminal window.
isw
tsw <- tile.list(dsw)
plot(tsw,number=TRUE,col.num="red",cex=0.5,adj=0.5)



