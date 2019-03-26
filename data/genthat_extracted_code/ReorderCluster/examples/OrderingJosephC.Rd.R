library(ReorderCluster)


### Name: OrderingJosephC
### Title: Makes the calculation of the evaluation function for each
###   subtree of the hierarchical tree using the dynamic programming
###   approach (C++ version)
### Aliases: OrderingJosephC
### Keywords: reordering clustering tree

### ** Examples

data(leukemia)
rownames(leukemia)=leukemia[,1]
leukemia=leukemia[,-1]
matr=leukemia[,-101]
nclass=leukemia[,101]
  
matr=as.matrix(matr)
dis=dist(matr)
hc <- hclust(dis)

coef=1.5
num=dim(hc$merge)[1]
A=array(1,c(num+1,num+1))
r=array(1,c(num+1,num+1))

maxI=array(0,c(num+1,num+1))
maxJ=array(0,c(num+1,num+1))
ind=num
  
node=testBar(hc)
flag=CalcMerge(hc,node,nclass)
## change matrix hc$merge
hO<-hc
nodeO<-node
out=SubTree(ind,flag,node,hc,A,r,coef)
hc=out$hc
node=out$node
A=out$A
r=out$r

res=OrderingJosephC(ind-1, hc$merge, node, A, r, maxI, maxJ, nclass, coef)



