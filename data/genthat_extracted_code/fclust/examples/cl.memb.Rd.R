library(fclust)


### Name: cl.memb
### Title: Cluster membership
### Aliases: cl.memb
### Keywords: multivariate

### ** Examples

n=20
k=3
## randomly generated membership degree matrix
U=matrix(runif(n*k,0,1), nrow=n, ncol=k)
U=U/apply(U,1,sum)
info.U=cl.memb(U)
## objects assigned to cluster 2
rownames(info.U[info.U[,1]==2,])



