library(fclust)


### Name: cl.size
### Title: Cluster size
### Aliases: cl.size
### Keywords: multivariate

### ** Examples

n=20
k=3
## randomly generated membership degree matrix
U=matrix(runif(n*k,0,1), nrow=n, ncol=k)
U=U/apply(U,1,sum)
clus.size=cl.size(U)



