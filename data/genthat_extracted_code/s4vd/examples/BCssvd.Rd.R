library(s4vd)


### Name: BCssvd
### Title: Biclustering via sparse singular value decomposition
### Aliases: BCssvd BCssvd-class ssvd \S4method{biclust}{matrix,BCssvd}
### Keywords: cluster classif svd

### ** Examples

## No test: 
# example data set according to the simulation study in Lee et al. 2010
# generate artifical data set and a correspondig biclust object
u <- c(10,9,8,7,6,5,4,3,rep(2,17),rep(0,75))
v <- c(10,-10,8,-8,5,-5,rep(3,5),rep(-3,5),rep(0,34))
u <- u/sqrt(sum(u^2)) 
v <- v/sqrt(sum(v^2))
d <- 50
set.seed(1)
X <- (d*u%*%t(v)) + matrix(rnorm(100*50),100,50)
params <- info <- list()
RowxNumber <- matrix(rep(FALSE,100),ncol=1)
NumberxCol <- matrix(rep(FALSE,50),nrow=1)
RowxNumber[u!=0,1] <- TRUE 
NumberxCol[1,v!=0] <- TRUE
Number <- 1
ressim <- BiclustResult(params,RowxNumber,NumberxCol,Number,info)

#perform s4vd biclustering 
ress4vd <- biclust(X,method=BCs4vd,pcerv=0.5,pceru=0.5,pointwise=FALSE,nbiclust=1,savepath=TRUE)
#perform s4vd biclustering with fast pointwise stability selection
ress4vdpw <- biclust(X,method=BCs4vd,pcerv=0.5,pceru=0.5,pointwise=TRUE,nbiclust=1)
#perform ssvd biclustering
resssvd <- biclust(X,BCssvd,K=1)
#agreement of the results with the simulated bicluster
jaccardind(ressim,ress4vd)
jaccardind(ressim,ress4vdpw)
jaccardind(ressim,resssvd)
## End(No test)



