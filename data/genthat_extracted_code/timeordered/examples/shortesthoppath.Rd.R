library(timeordered)


### Name: shortesthoppath
### Title: Determines a path (shortest by the least number of unique
###   vertices) between two vertices at two times.
### Aliases: shortesthoppath
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
g <- generatetonetwork(ants, allindivs)
shp <- shortesthoppath(g, "WBGG", 927, "GYGG", 1423)
plottonet(g, shp)
title(paste(length(unique(shp$Name))," hops"))





