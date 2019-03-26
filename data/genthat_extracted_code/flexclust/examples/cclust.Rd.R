library(flexclust)


### Name: cclust
### Title: Convex Clustering
### Aliases: cclust
### Keywords: cluster

### ** Examples

## a 2-dimensional example
x <- rbind(matrix(rnorm(100, sd=0.3), ncol=2),
           matrix(rnorm(100, mean=1, sd=0.3), ncol=2))
cl <- cclust(x,2)
plot(x, col=predict(cl))
points(cl@centers, pch="x", cex=2, col=3) 

## a 3-dimensional example 
x <- rbind(matrix(rnorm(150, sd=0.3), ncol=3),
           matrix(rnorm(150, mean=2, sd=0.3), ncol=3),
           matrix(rnorm(150, mean=4, sd=0.3), ncol=3))
cl <- cclust(x, 6, method="neuralgas", save.data=TRUE)
pairs(x, col=predict(cl))
plot(cl)



