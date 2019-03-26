library(qkerntool)


### Name: Eucdist
### Title: Computes the Euclidean(square Euclidean) distance matrix
### Aliases: Eucdist Eucdist,matrix-method

### ** Examples

###
data(iris)
testset <- sample(1:150,20)
x <- as.matrix(iris[-testset,-5])
y <- as.matrix(iris[testset,-5])

##
res0 <- Eucdist(x)
res1 <- Eucdist(x, x, sEuclidean = FALSE)
res2 <- Eucdist(x, y = NULL, sEuclidean = FALSE)
res3 <- Eucdist(x, x, sEuclidean = TRUE)
res4 <- Eucdist(x, y = NULL)
res5 <- Eucdist(x, sEuclidean = FALSE)



