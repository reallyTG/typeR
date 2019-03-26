library(fclust)


### Name: cl.memb.t
### Title: Cluster membership
### Aliases: cl.memb.t
### Keywords: multivariate

### ** Examples

n=20
k=3
## randomly generated membership degree matrix
U=matrix(runif(n*k,0,1), nrow=n, ncol=k)
U=U/apply(U,1,sum)
## threshold t=0.6
info.U=cl.memb.t(U,0.6)
## objects clearly assigned to clusters
rownames(info.U[info.U[,1]!=0,])



