library(ReorderCluster)


### Name: SubTree
### Title: Simplifies the initial hierarchical tree by reducing the number
###   of nodes. Constructs the new merging matrix with some inner nodes
###   substituted by one element from the coressponding subtree.
### Aliases: SubTree
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

coef=1.5
num=dim(hc$merge)[1]
A=array(1,c(num+1,num+1))
r=array(1,c(num+1,num+1))

ind=num
node=testBar(hc)
flag=CalcMerge(hc,node,class)
out=SubTree(ind,flag,node,hc,A,r,coef)



