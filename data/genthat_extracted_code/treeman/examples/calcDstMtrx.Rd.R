library(treeman)


### Name: calcDstMtrx
### Title: Calculate the distance matrix
### Aliases: calcDstMtrx

### ** Examples

# checking the distance between two trees
library(treeman)
tree_1 <- randTree(10)
tree_2 <- randTree(10)
dmat1 <- calcDstMtrx(tree_1, tree_1['tips'])
dmat2 <- calcDstMtrx(tree_2, tree_2['tips'])
mdl <- cor.test(x=dmat1, y=dmat2)
as.numeric(1 - mdl$estimate)  # 1 - Pearson's r



