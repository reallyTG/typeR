library(ReorderCluster)


### Name: funMerge
### Title: Recover the optimal sequence of leaves in the hierarchical tree
###   according to available class labels.
### Aliases: funMerge
### Keywords: recovering optimal

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

res=OrderingJosephC(ind-1, hc$merge, node, A, r, maxI, maxJ, class, coef)
A=res$A
maxI=res$maxI
maxJ=res$maxJ
r=res$r
	
col=which.max(apply(A[node[[ind]]$left,node[[ind]]$right,drop=FALSE],2,max))
row=which.max(apply(A[node[[ind]]$left,node[[ind]]$right,drop=FALSE],1,max))
col=node[[ind]]$right[col]
row=node[[ind]]$left[row]

hcl=funMerge(ind,row,col,hO,node,maxI,maxJ,TRUE)



