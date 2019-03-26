library(PPtree)


### Name: PDA.Tree
### Title: Find PP tree structure using PDA
### Aliases: PDA.Tree
### Keywords: tree

### ** Examples


data(iris)
n <- nrow(iris)
tot <- c(1:n)
n.train <- round(n*0.9)
train <- sample(tot,n.train)
test <- tot[-train]

Tree.result <- PDA.Tree(iris[train,5],iris[train,1:4])
Tree.result



