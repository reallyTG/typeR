library(multiway)


### Name: sca
### Title: Simultaneous Component Analysis
### Aliases: sca
### Keywords: models multivariate

### ** Examples

##########   sca-p   ##########

# create random data list with SCA-P structure
set.seed(3)
mydim <- c(NA,10,20)
nf <- 2
nk <- sample(c(50,100,200),mydim[3],replace=TRUE)
Dmat <- matrix(rnorm(sum(nk)*nf),sum(nk),nf)
Bmat <- matrix(runif(mydim[2]*nf),mydim[2],nf)
Dmats <- vector("list",mydim[3])
Xmat <- Emat <- vector("list",mydim[3])
dfc <- 0
for(k in 1:mydim[3]){
  dinds <- 1:nk[k] + dfc
  Dmats[[k]] <- Dmat[dinds,]
  dfc <- dfc + nk[k]
  Xmat[[k]] <- tcrossprod(Dmats[[k]],Bmat)
  Emat[[k]] <- matrix(rnorm(nk[k]*mydim[2]),nk[k],mydim[2])
}
rm(Dmat)
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR=1
X <- mapply("+",Xmat,Emat)

# fit SCA-P model (no rotation)
scamod <- sca(X,nfac=nf,nstart=1)
scamod

# check solution
crossprod(scamod$D[[1]] %*% diag(scamod$C[1,]^-1) ) / nk[1]
crossprod(scamod$D[[5]] %*% diag(scamod$C[5,]^-1) ) / nk[5]
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])

# reorder and resign factors
scamod$B[1:4,]
scamod <- reorder(scamod, 2:1)
scamod$B[1:4,]
scamod <- resign(scamod, mode="B", newsign=c(1,-1))
scamod$B[1:4,]
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])

# rescale factors
colSums(scamod$B^2)
colSums(scamod$C^2)
scamod <- rescale(scamod, mode="C")
colSums(scamod$B^2)
colSums(scamod$C^2)
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])


##########   sca-pf2   ##########

# create random data list with SCA-PF2 (Parafac2) structure
set.seed(3)
mydim <- c(NA,10,20)
nf <- 2
nk <- sample(c(50,100,200),mydim[3],replace=TRUE)
Gmat <- 10*matrix(rnorm(nf^2),nf,nf)
Bmat <- matrix(runif(mydim[2]*nf),mydim[2],nf)
Cmat <- matrix(runif(mydim[3]*nf),mydim[3],nf)
Xmat <- Emat <- Fmat <- vector("list",mydim[3])
for(k in 1:mydim[3]){
  Fmat[[k]] <- svd(matrix(rnorm(nk[k]*nf),nk[k],nf),nv=0)$u
  Xmat[[k]] <- tcrossprod(Fmat[[k]]%*%Gmat%*%diag(Cmat[k,]),Bmat)
  Emat[[k]] <- matrix(rnorm(nk[k]*mydim[2]),nk[k],mydim[2])
}
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR=1
X <- mapply("+",Xmat,Emat)

# fit SCA-PF2 model
scamod <- sca(X,nfac=nf,nstart=1,type="sca-pf2")
scamod

# check solution
scamod$Phi
crossprod(scamod$D[[1]] %*% diag(scamod$C[1,]^-1) ) / nk[1]
crossprod(scamod$D[[5]] %*% diag(scamod$C[5,]^-1) ) / nk[5]
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])

# reorder and resign factors
scamod$B[1:4,]
scamod <- reorder(scamod, 2:1)
scamod$B[1:4,]
scamod <- resign(scamod, mode="B", newsign=c(1,-1))
scamod$B[1:4,]
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])

# rescale factors
colSums(scamod$B^2)
colSums(scamod$C^2)
scamod <- rescale(scamod, mode="C")
colSums(scamod$B^2)
colSums(scamod$C^2)
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])


##########   sca-ind   ##########

# create random data list with SCA-IND structure
set.seed(3)
mydim <- c(NA,10,20)
nf <- 2
nk <- sample(c(50,100,200),mydim[3],replace=TRUE)
Gmat <- diag(nf)  # SCA-IND is Parafac2 with Gmat=identity
Bmat <- matrix(runif(mydim[2]*nf),mydim[2],nf)
Cmat <- 10*matrix(runif(mydim[3]*nf),mydim[3],nf)
Xmat <- Emat <- Fmat <- vector("list",mydim[3])
for(k in 1:mydim[3]){
  Fmat[[k]] <- svd(matrix(rnorm(nk[k]*nf),nk[k],nf),nv=0)$u
  Xmat[[k]] <- tcrossprod(Fmat[[k]]%*%Gmat%*%diag(Cmat[k,]),Bmat)
  Emat[[k]] <- matrix(rnorm(nk[k]*mydim[2]),nk[k],mydim[2])
}
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR=1
X <- mapply("+",Xmat,Emat)

# fit SCA-IND model
scamod <- sca(X,nfac=nf,nstart=1,type="sca-ind")
scamod

# check solution
scamod$Phi
crossprod(scamod$D[[1]] %*% diag(scamod$C[1,]^-1) ) / nk[1]
crossprod(scamod$D[[5]] %*% diag(scamod$C[5,]^-1) ) / nk[5]
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])

# reorder and resign factors
scamod$B[1:4,]
scamod <- reorder(scamod, 2:1)
scamod$B[1:4,]
scamod <- resign(scamod, mode="B", newsign=c(1,-1))
scamod$B[1:4,]
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])

# rescale factors
colSums(scamod$B^2)
colSums(scamod$C^2)
scamod <- rescale(scamod, mode="C")
colSums(scamod$B^2)
colSums(scamod$C^2)
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])


##########   sca-ecp   ##########

# create random data list with SCA-ECP structure
set.seed(3)
mydim <- c(NA,10,20)
nf <- 2
nk <- sample(c(50,100,200),mydim[3],replace=TRUE)
Gmat <- diag(nf)
Bmat <- matrix(runif(mydim[2]*nf),mydim[2],nf)
Cmat <- matrix(sqrt(nk),mydim[3],nf)
Xmat <- Emat <- Fmat <- vector("list",mydim[3])
for(k in 1:mydim[3]){
  Fmat[[k]] <- svd(matrix(rnorm(nk[k]*nf),nk[k],nf),nv=0)$u
  Xmat[[k]] <- tcrossprod(Fmat[[k]]%*%Gmat%*%diag(Cmat[k,]),Bmat)
  Emat[[k]] <- matrix(rnorm(nk[k]*mydim[2]),nk[k],mydim[2])
}
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR=1
X <- mapply("+",Xmat,Emat)

# fit SCA-ECP model
scamod <- sca(X,nfac=nf,nstart=1,type="sca-ecp")
scamod

# check solution
scamod$Phi
crossprod(scamod$D[[1]] %*% diag(scamod$C[1,]^-1) ) / nk[1]
crossprod(scamod$D[[5]] %*% diag(scamod$C[5,]^-1) ) / nk[5]
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])

# reorder and resign factors
scamod$B[1:4,]
scamod <- reorder(scamod, 2:1)
scamod$B[1:4,]
scamod <- resign(scamod, mode="B", newsign=c(-1,1))
scamod$B[1:4,]
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])

# rescale factors
colSums(scamod$B^2)
colSums(scamod$C^2)
scamod <- rescale(scamod, mode="B")
colSums(scamod$B^2)
colSums(scamod$C^2)
Xhat <- fitted(scamod)
sse <- sumsq(mapply("-",Xmat,Xhat))
sse/(sum(nk)*mydim[2])


## Not run: 
##D 
##D ##########   parallel computation   ##########
##D 
##D # create random data list with SCA-IND structure
##D set.seed(3)
##D mydim <- c(NA,10,20)
##D nf <- 2
##D nk <- sample(c(50,100,200),mydim[3],replace=TRUE)
##D Gmat <- diag(nf)  # SCA-IND is Parafac2 with Gmat=identity
##D Bmat <- matrix(runif(mydim[2]*nf),mydim[2],nf)
##D Cmat <- 10*matrix(runif(mydim[3]*nf),mydim[3],nf)
##D Xmat <- Emat <- Fmat <- vector("list",mydim[3])
##D for(k in 1:mydim[3]){
##D   Fmat[[k]] <- svd(matrix(rnorm(nk[k]*nf),nk[k],nf),nv=0)$u
##D   Xmat[[k]] <- tcrossprod(Fmat[[k]]%*%Gmat%*%diag(Cmat[k,]),Bmat)
##D   Emat[[k]] <- matrix(rnorm(nk[k]*mydim[2]),nk[k],mydim[2])
##D }
##D Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR=1
##D X <- mapply("+",Xmat,Emat)
##D 
##D # fit SCA-PF2 model (10 random starts -- sequential computation)
##D set.seed(1)
##D system.time({scamod <- sca(X,nfac=nf,type="sca-pf2")})
##D scamod
##D 
##D # fit SCA-PF2 model (10 random starts -- parallel computation)
##D cl <- makeCluster(detectCores())
##D ce <- clusterEvalQ(cl,library(multiway))
##D clusterSetRNGStream(cl, 1)
##D system.time({scamod <- sca(X,nfac=nf,type="sca-pf2",parallel=TRUE,cl=cl)})
##D scamod
##D stopCluster(cl)
##D 
##D # fit SCA-IND model (10 random starts -- sequential computation)
##D set.seed(1)
##D system.time({scamod <- sca(X,nfac=nf,type="sca-ind")})
##D scamod
##D 
##D # fit SCA-IND model (10 random starts -- parallel computation)
##D cl <- makeCluster(detectCores())
##D ce <- clusterEvalQ(cl,library(multiway))
##D clusterSetRNGStream(cl, 1)
##D system.time({scamod <- sca(X,nfac=nf,type="sca-ind",parallel=TRUE,cl=cl)})
##D scamod
##D stopCluster(cl)
##D 
##D # fit SCA-ECP model (10 random starts -- sequential computation)
##D set.seed(1)
##D system.time({scamod <- sca(X,nfac=nf,type="sca-ecp")})
##D scamod
##D 
##D # fit SCA-ECP model (10 random starts -- parallel computation)
##D cl <- makeCluster(detectCores())
##D ce <- clusterEvalQ(cl,library(multiway))
##D clusterSetRNGStream(cl, 1)
##D system.time({scamod <- sca(X,nfac=nf,type="sca-ecp",parallel=TRUE,cl=cl)})
##D scamod
##D stopCluster(cl)
## End(Not run)




