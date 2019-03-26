library(fclust)


### Name: cl.size.H
### Title: Cluster size
### Aliases: cl.size.H
### Keywords: multivariate

### ** Examples

n=20
k=3
## randomly generated membership degree matrix
U=matrix(runif(n*k,0,1), nrow=n, ncol=k)
U=U/apply(U,1,sum)
## cluster size in the hard clustering sense
clus.size=cl.size.H(U)



