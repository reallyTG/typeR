library(pmr)


### Name: local.knn
### Title: Local k-nearest neighbor method for label ranking.
### Aliases: local.knn
### Keywords: local.knn

### ** Examples

## create an artificial dataset
X1 <- c(1,1,2,2,3,3)
X2 <- c(2,3,1,3,1,2)
X3 <- c(3,2,3,1,2,1)
co <- c(6,5,4,3,2,1)
co.test <- 1.2
train <- data.frame(X1,X2,X3)

## local k-nearest neighbor method of the artificial dataset
## local.knn(train,co.test,co)



