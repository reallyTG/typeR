library(PPtree)


### Name: PP.classify
### Title: Predict class for the test set and calculate prediction error
### Aliases: PP.classify
### Keywords: tree

### ** Examples

data(iris)
n <- nrow(iris)
n.train <- round(n*0.9)
train <- sample(n, n.train)

Tree.result <- PP.Tree("LDA", iris[train,5], iris[train, 1:4])
tree.train <- PP.classify(iris[train, 1:4], iris[train, 5], Tree.result,
                          Rule=1)
tree.train
tree.test <- PP.classify(iris[-train, 1:4], iris[-train, 5],
                         Tree.result, Rule=1)
tree.test



