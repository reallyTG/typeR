library(PPtreeViz)


### Name: predict.PPtreeclass
### Title: predict PPtree
### Aliases: predict.PPtreeclass predict
### Keywords: tree

### ** Examples

data(iris)
n <- nrow(iris)
tot <- c(1:n)
n.train <- round(n*0.9)
train <- sample(tot,n.train)
test <- tot[-train]
Tree.result <- PPTreeclass(Species~., data=iris[train,],"LDA")
predict(Tree.result)



