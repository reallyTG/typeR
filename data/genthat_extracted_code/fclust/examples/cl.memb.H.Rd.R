library(fclust)


### Name: cl.memb.H
### Title: Cluster membership
### Aliases: cl.memb.H
### Keywords: multivariate

### ** Examples

n=20
k=3
## randomly generated membership degree matrix
U=matrix(runif(n*k,0,1), nrow=n, ncol=k)
U=U/apply(U,1,sum)
info.U=cl.memb.H(U)
## objects assigned to clusters in the hard clustering sense
rownames(info.U[info.U[,1]!=0,])



