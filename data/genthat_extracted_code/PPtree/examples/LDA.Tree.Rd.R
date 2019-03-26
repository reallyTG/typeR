library(PPtree)


### Name: LDA.Tree
### Title: Find PP tree structure using LDA
### Aliases: LDA.Tree
### Keywords: tree

### ** Examples


data(iris)
n <- nrow(iris)
tot <- c(1:n)
n.train <- round(n*0.9)
train <- sample(tot,n.train)
test <- tot[-train]

Tree.result <- LDA.Tree(iris[train,5],iris[train,1:4])
Tree.result



