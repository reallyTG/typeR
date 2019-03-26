library(PPtreeViz)


### Name: PPclassify
### Title: predict PPtree
### Aliases: PPclassify
### Keywords: tree

### ** Examples

data(iris)
n <- nrow(iris)
tot <- c(1:n)
n.train <- round(n*0.9)
train <- sample(tot,n.train)
test <- tot[-train]
Tree.result <- PPTreeclass(Species~.,data=iris[train,],"LDA")
PPclassify(Tree.result,iris[test,1:4],1,iris[test,5])



