library(rpca)


### Name: rpca
### Title: Decompose a matrix into a low-rank component and a sparse
###   component by solving Principal Components Pursuit
### Aliases: rpca
### Keywords: rpca robust pca low-rank and sparse components

### ** Examples

data(iris)
M <- as.matrix(iris[,1:4])
Mcent <- sweep(M,2,colMeans(M))

res <- rpca(Mcent)

## Check convergence and number of iterations
with(res$convergence,list(converged,iterations))
## Final delta F2 norm divided by F2norm(Mcent)
with(res$convergence,final.delta)

## Check properites of the decomposition
with(res,c(
all(abs( L+S - Mcent ) < 10^-5),
all( L == L.svd$u%*%(L.svd$d*L.svd$vt) )
))
# [1] TRUE TRUE

## The low rank component has rank 2
length(res$L.svd$d)
## However, the sparse component is not sparse 
## - thus this data set is not the best example here.
mean(res$S==0)

## Plot the first (the only) two principal components
## of the low-rank component L
rpc<-res$L.svd$u%*%diag(res$L.svd$d)
plot(jitter(rpc[,1:2],amount=.001),col=iris[,5])

## Compare with classical principal components
pc <- prcomp(M,center=TRUE)
plot(pc$x[,1:2],col=iris[,5])
points(rpc[,1:2],col=iris[,5],pch="+")

## "Sparse" elements distribution
plot(density(abs(res$S),from=0))
curve(dexp(x,rate=1/mean(abs(res$S))),add=TRUE,lty=2)

## Plot measurements against measurements corrected by sparse components
par(mfcol=c(2,2))
for(i in 1:4) {
plot(M[,i],M[,i]-res$S[,i],col=iris[,5],xlab=colnames(M)[i])
}



