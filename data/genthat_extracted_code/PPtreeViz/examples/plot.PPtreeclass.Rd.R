library(PPtreeViz)


### Name: plot.PPtreeclass
### Title: PPtree plot
### Aliases: plot.PPtreeclass plot
### Keywords: tree

### ** Examples

data(iris)
Tree.result <- PPTreeclass(Species~., data = iris,"LDA")
Tree.result
plot(Tree.result)



