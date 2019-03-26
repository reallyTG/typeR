library(superml)


### Name: KNNTrainer
### Title: K Nearest Neighbours Trainer
### Aliases: KNNTrainer
### Keywords: datasets

### ** Examples

data("iris")

iris$Species <- as.integer(as.factor(iris$Species))

xtrain <- iris[1:100,]
xtest <- iris[101:150,]

bst <- KNNTrainer$new(k=3, prob=TRUE, type="class")
bst$fit(xtrain, xtest, 'Species')
pred <- bst$predict(type="raw")



