library(nabor)


### Name: knn
### Title: Find K nearest neighbours for multiple query points
### Aliases: knn

### ** Examples

## Basic usage
# load sample data consisting of list of 3 separate 3d pointets
data(kcpoints)

# Nearest neighbour in first pointset of all points in second pointset 
nn1 <- knn(data=kcpoints[[1]], query=kcpoints[[2]], k=1)
str(nn1)

# 5 nearest neighbours
nn5 <-knn(data=kcpoints[[1]], query=kcpoints[[2]], k=5)
str(nn5)

# Self match within first pointset, all distances will be 0
nnself1 <- knn(data=kcpoints[[1]], k=1)
str(nnself1)

# neighbour 2 will be the nearest point 
nnself2 <- knn(data=kcpoints[[1]], k=2)

## Advanced usage
# nearest neighbour with radius bound
nn1.rad <- knn(data=kcpoints[[1]], query=kcpoints[[2]], k=1, radius=5)
str(nn1.rad)

# approximate nearest neighbour with 10% error bound
nn1.approx <- knn(data=kcpoints[[1]], query=kcpoints[[2]], k=1, eps=0.1)
str(nn1.approx)

# 5 nearest neighbours, brute force search
nn5.b <-knn(data=kcpoints[[1]], query=kcpoints[[2]], k=5, searchtype='brute')
stopifnot(all.equal(nn5.b, nn5))

# 5 nearest neighbours, brute force search (specified by int)
nn5.b2 <-knn(data=kcpoints[[1]], query=kcpoints[[2]], k=5, searchtype=2L)
stopifnot(all.equal(nn5.b2, nn5.b))



