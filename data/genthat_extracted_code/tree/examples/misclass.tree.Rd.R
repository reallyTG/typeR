library(tree)


### Name: misclass.tree
### Title: Misclassifications by a Classification Tree
### Aliases: misclass.tree
### Keywords: tree

### ** Examples

ir.tr <- tree(Species ~., iris)
misclass.tree(ir.tr)
misclass.tree(ir.tr, detail=TRUE)



