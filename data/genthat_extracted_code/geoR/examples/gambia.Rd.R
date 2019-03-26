library(geoR)


### Name: gambia
### Title: Gambia Malaria Data
### Aliases: gambia gambia.borders gambia.map
### Keywords: datasets

### ** Examples

plot(gambia.borders, type="l", asp=1)
points(gambia[,1:2], pch=19)
# a built-in function for a zoomed map
gambia.map()
# Building a "village-level" data frame
ind <- paste("x",gambia[,1], "y", gambia[,2], sep="")
village <- gambia[!duplicated(ind),c(1:2,7:8)]
village$prev <- as.vector(tapply(gambia$pos, ind, mean))
plot(village$green, village$prev)



