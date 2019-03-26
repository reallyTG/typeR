library(BayesX)


### Name: get.centroids
### Title: Compute Centroids of Polygons
### Aliases: get.centroids
### Keywords: spatial

### ** Examples

germany <- read.bnd(system.file("examples/germany.bnd", package="BayesX"))
centroids <- get.centroids(germany)
centroids[1:10,]

plot(c(2100,3700),c(6800,8500),type="n", xlab="", ylab="")
for(i in 1:10){
   polygon(germany[[i]])
   region <- attr(germany,"names")[i]
   text(x=centroids[i,2]+50, y=centroids[i,3]+30, region, cex=0.7)
}   
points(centroids[1:10,2:3], col='red', pch=16)



