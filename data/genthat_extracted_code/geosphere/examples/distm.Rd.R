library(geosphere)


### Name: distm
### Title: Distance matrix
### Aliases: distm
### Keywords: spatial

### ** Examples

xy <- rbind(c(0,0),c(90,90),c(10,10),c(-120,-45))
distm(xy)
xy2 <- rbind(c(0,0),c(10,-10))
distm(xy, xy2)



