library(BCSub)


### Name: calSim
### Title: Function to calculate the similarity matrix based on the cluster
###   membership indicator of each iteration.
### Aliases: calSim

### ** Examples

n = 90 ## number of subjects
iters = 200 ## number of iterations
## matrix of cluster membership indicators
## perfect clustering with three clusters
mat = matrix(rep(1:3,each=n/3),nrow=n,ncol=iters)
sim = calSim(t(mat))
## plot similarity matrix
x <- rep(1:n,times=n)
y <- rep(1:n,each=n)
z <- as.vector(sim)
levelplot(z~x*y,col.regions=rev(gray.colors(n^2)), xlab = "Subject ID",ylab = "Subject ID")



