library(PPtreeViz)


### Name: print.PPtreeclass
### Title: Print PP.Tree.class result
### Aliases: print.PPtreeclass
### Keywords: tree

### ** Examples

data(iris)
Tree.result <- PPTreeclass(Species~.,data = iris,"LDA")
Tree.result
print(Tree.result,coef.print=TRUE,cutoff.print=TRUE)




