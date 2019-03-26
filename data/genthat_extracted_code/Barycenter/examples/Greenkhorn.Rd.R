library(Barycenter)


### Name: Greenkhorn
### Title: Greenkhorn Distances (approximation to EMD)
### Aliases: Greenkhorn

### ** Examples

#Sinkhorn Distances between the first image to the second image in the dataset eight.
#We creat costm simply using a distance matrix on the grid [0,1]x[0,1].
n <- seq(0,1,length.out = dim(eight[[1]])[2])
costm <- as.matrix(dist(expand.grid(n,rev(n)), diag=TRUE, upper=TRUE))
r <- matrix(eight[[1]],28*28,1)
c <- matrix(eight[[2]],1,28*28)
Greenkhorn(r, c, costm)$Distance



