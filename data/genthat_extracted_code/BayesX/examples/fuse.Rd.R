library(BayesX)


### Name: fuse
### Title: Combine Regions
### Aliases: fuse
### Keywords: spatial

### ** Examples

require("gpclib")
library("maptools")
gpclibPermit()
map <- read.bnd(system.file("examples/germany9301.bnd", package="BayesX"))
drawmap(map=map, drawnames=TRUE)

#vector of regions to be combined 
regions <- c("1056","1060","1061")
#new name of combined region
newname <- "1"
newmap <- fuse(map,regions,newname)
drawmap(map=newmap,drawnames=TRUE)

#vector of regions to be combined
germany <- read.bnd(system.file("examples/germany.bnd", package="BayesX"))
drawmap(map=germany, drawnames=TRUE)
regions <- c("9371","9373","9374","9471","9472","9474","9574")
#new name of combined region
newname <- "1"
newmap <- fuse(germany,regions,newname)
drawmap(map=newmap,drawnames=TRUE)



