library(DMwR2)


### Name: kNN
### Title: k-Nearest Neighbour Classification
### Aliases: kNN
### Keywords: models

### ** Examples

## A small example with the IRIS data set
data(iris)

## Split in train + test set
idxs <- sample(1:nrow(iris),as.integer(0.7*nrow(iris)))
trainIris <- iris[idxs,]
testIris <- iris[-idxs,]

## A 3-nearest neighbours model with no standardization
nn3 <- kNN(Species ~ .,trainIris,testIris,stand=FALSE,k=3)

## The resulting confusion matrix
table(testIris[,'Species'],nn3)

## Now a 5-nearest neighbours model with standardization
nn5 <- kNN(Species ~ .,trainIris,testIris,stand=TRUE,k=5)

## The resulting confusion matrix
table(testIris[,'Species'],nn5)





