library(treespace)


### Name: treeVec
### Title: Tree vector function
### Aliases: treeVec

### ** Examples


## generate a random tree
tree <- rtree(6)
## topological vector of mrca distances from root:
treeVec(tree)
## vector of mrca distances from root when lambda=0.5:
treeVec(tree,0.5)
## vector of mrca distances as a function of lambda:
vecAsFunction <- treeVec(tree,return.lambda.function=TRUE)
## evaluate the vector at lambda=0.5:
vecAsFunction(0.5)





