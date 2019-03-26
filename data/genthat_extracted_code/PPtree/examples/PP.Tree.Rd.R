library(PPtree)


### Name: PP.Tree
### Title: Find PP tree structure
### Aliases: PP.Tree
### Keywords: tree

### ** Examples


data(iris)
n <- nrow(iris)
tot <- c(1:n)
n.train <- round(n*0.9)
train <- sample(tot,n.train)
test <- tot[-train]

Tree.result <- PP.Tree("LDA",iris[train,5],iris[train,1:4])
Tree.result



