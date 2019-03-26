library(PPtreeViz)


### Name: PPclassNodeViz
### Title: PPtree node visualization
### Aliases: PPclassNodeViz
### Keywords: tree

### ** Examples

data(iris)
Tree.result <- PPTreeclass(Species~., data = iris,"LDA")
Tree.result
PPclassNodeViz(Tree.result,1,1)



