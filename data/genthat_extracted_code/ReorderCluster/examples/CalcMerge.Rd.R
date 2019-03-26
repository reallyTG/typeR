library(ReorderCluster)


### Name: CalcMerge
### Title: Forms the binary vector to mark the nodes with identical class
###   labels.
### Aliases: CalcMerge
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
flag=CalcMerge(hc,node,class)



