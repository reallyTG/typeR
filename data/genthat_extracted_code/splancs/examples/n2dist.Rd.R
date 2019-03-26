library(splancs)


### Name: n2dist
### Title: Nearest neighbours for two point patterns
### Aliases: n2dist
### Keywords: spatial

### ** Examples

(test1 <- matrix(c(151.1791, -33.86056, 151.1599, -33.88729, 151.1528,
-33.90685, 151.1811, -33.85937),nrow=4,byrow=TRUE))
(test2 <- as.points(151.15, -33.9))
n2dist(test1,test2)
n2dist(test2,test1)



