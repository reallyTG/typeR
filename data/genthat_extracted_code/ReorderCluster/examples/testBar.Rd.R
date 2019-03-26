library(ReorderCluster)


### Name: testBar
### Title: For each node (subtree) of the hierarchical tree forms two
###   vectors, consisting of elements of its left and write subtrees.
### Aliases: testBar
### Keywords: clustering node

### ** Examples

data(leukemia)
rownames(leukemia)=leukemia[,1]
leukemia=leukemia[,-1]
matr=leukemia[,-101]
class=leukemia[,101]

matr=as.matrix(matr)
dist=dist(matr)
hc <- hclust(dist)
node=testBar(hc)



