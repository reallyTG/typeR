library(ReorderCluster)


### Name: OrderingJoseph
### Title: Makes the calculation of the evaluation function for each
###   subtree of the hierarchical tree using the dynamic programming
###   approach
### Aliases: OrderingJoseph
### Keywords: reordering clustering tree

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

maxI=array(0,c(num+1,num+1))
maxJ=array(0,c(num+1,num+1))
ind=num
  
node=testBar(hc)
flag=CalcMerge(hc,node,class)
## change matrix hc$merge
hO<-hc
nodeO<-node
out=SubTree(ind,flag,node,hc,A,r,coef)
hc=out$hc
node=out$node
A=out$A
r=out$r

res=OrderingJoseph(ind, hc, node, A, r, maxI, maxJ, class, coef)



