library(Barycenter)


### Name: Sinkhorn
### Title: Sinkhorn Distances (upper bound to EMD)
### Aliases: Sinkhorn

### ** Examples

#Sinkhorn Distances between the first image to the remaining four images in the dataset eight.
#We creat costm simply using a distance matrix on the grid [0,1]x[0,1].
n <- seq(0,1,length.out = dim(eight[[1]])[2])
costm <- as.matrix(dist(expand.grid(n,rev(n)), diag=TRUE, upper=TRUE))
a <- matrix(eight[[1]],28*28,1)
b <- matrix(c(eight[[2]],eight[[3]],eight[[4]],eight[[5]]),28*28,4)
Sinkhorn(a, b, costm)



