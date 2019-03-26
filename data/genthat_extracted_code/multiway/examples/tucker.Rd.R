library(multiway)


### Name: tucker
### Title: Tucker Factor Analysis
### Aliases: tucker
### Keywords: models multivariate

### ** Examples

##########   3-way example   ##########

# create random data array with Tucker structure
set.seed(3)
mydim <- c(50,20,5)
nf <- c(3,2,3)
Amat <- svd(matrix(rnorm(mydim[1]*nf[1]),mydim[1],nf[1]),nu=nf[1])$u
Bmat <- svd(matrix(rnorm(mydim[2]*nf[2]),mydim[2],nf[2]),nu=nf[2])$u
Cmat <- svd(matrix(rnorm(mydim[3]*nf[3]),mydim[3],nf[3]),nu=nf[3])$u
Gmat <- array(rnorm(prod(nf)),dim=nf)
Xmat <- array(tcrossprod(Amat%*%matrix(Gmat,nf[1],nf[2]*nf[3]),kronecker(Cmat,Bmat)),dim=mydim)
Emat <- array(rnorm(prod(mydim)),dim=mydim)
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR=1
X <- Xmat + Emat

# fit Tucker model
tuck <- tucker(X,nfac=nf,nstart=1)
tuck

# check solution
Xhat <- fitted(tuck)
sum((Xmat-Xhat)^2)/prod(mydim)

# reorder mode="A"
tuck$A[1:4,]
tuck$G
tuck <- reorder(tuck, neworder=c(3,1,2), mode="A")
tuck$A[1:4,]
tuck$G
Xhat <- fitted(tuck)
sum((Xmat-Xhat)^2)/prod(mydim)

# reorder mode="B"
tuck$B[1:4,]
tuck$G
tuck <- reorder(tuck, neworder=2:1, mode="B")
tuck$B[1:4,]
tuck$G
Xhat <- fitted(tuck)
sum((Xmat-Xhat)^2)/prod(mydim)

# resign mode="C"
tuck$C[1:4,]
tuck <- resign(tuck, mode="C")
tuck$C[1:4,]
Xhat <- fitted(tuck)
sum((Xmat-Xhat)^2)/prod(mydim)


##########   4-way example   ##########

# create random data array with Tucker structure
set.seed(4)
mydim <- c(30,10,8,10)
nf <- c(2,3,4,3)
Amat <- svd(matrix(rnorm(mydim[1]*nf[1]),mydim[1],nf[1]),nu=nf[1])$u
Bmat <- svd(matrix(rnorm(mydim[2]*nf[2]),mydim[2],nf[2]),nu=nf[2])$u
Cmat <- svd(matrix(rnorm(mydim[3]*nf[3]),mydim[3],nf[3]),nu=nf[3])$u
Dmat <- svd(matrix(rnorm(mydim[4]*nf[4]),mydim[4],nf[4]),nu=nf[4])$u
Gmat <- array(rnorm(prod(nf)),dim=nf)
Xmat <- array(tcrossprod(Amat%*%matrix(Gmat,nf[1],prod(nf[2:4])),
                      kronecker(Dmat,kronecker(Cmat,Bmat))),dim=mydim)
Emat <- array(rnorm(prod(mydim)),dim=mydim)
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR=1
X <- Xmat + Emat

# fit Tucker model
tuck <- tucker(X,nfac=nf,nstart=1)
tuck

# check solution
Xhat <- fitted(tuck)
sum((Xmat-Xhat)^2)/prod(mydim)


## Not run: 
##D 
##D ##########   parallel computation   ##########
##D 
##D # create random data array with Tucker structure
##D set.seed(3)
##D mydim <- c(50,20,5)
##D nf <- c(3,2,3)
##D Amat <- svd(matrix(rnorm(mydim[1]*nf[1]),mydim[1],nf[1]),nu=nf[1])$u
##D Bmat <- svd(matrix(rnorm(mydim[2]*nf[2]),mydim[2],nf[2]),nu=nf[2])$u
##D Cmat <- svd(matrix(rnorm(mydim[3]*nf[3]),mydim[3],nf[3]),nu=nf[3])$u
##D Gmat <- array(rnorm(prod(nf)),dim=nf)
##D Xmat <- array(tcrossprod(Amat%*%matrix(Gmat,nf[1],nf[2]*nf[3]),kronecker(Cmat,Bmat)),dim=mydim)
##D Emat <- array(rnorm(prod(mydim)),dim=mydim)
##D Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR=1
##D X <- Xmat + Emat
##D 
##D # fit Tucker model (10 random starts -- sequential computation)
##D set.seed(1)
##D system.time({tuck <- tucker(X,nfac=nf)})
##D tuck$Rsq
##D 
##D # fit Tucker model (10 random starts -- parallel computation)
##D cl <- makeCluster(detectCores())
##D ce <- clusterEvalQ(cl,library(multiway))
##D clusterSetRNGStream(cl, 1)
##D system.time({tuck <- tucker(X,nfac=nf,parallel=TRUE,cl=cl)})
##D tuck$Rsq
##D stopCluster(cl)
## End(Not run)




