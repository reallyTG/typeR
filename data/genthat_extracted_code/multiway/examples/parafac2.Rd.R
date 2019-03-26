library(multiway)


### Name: parafac2
### Title: Parallel Factor Analysis-2
### Aliases: parafac2
### Keywords: models multivariate

### ** Examples

##########   3-way example   ##########

# create random data list with Parafac2 structure
set.seed(3)
mydim <- c(NA, 10, 20)
nf <- 2
nk <- sample(c(50, 100, 200), mydim[3], replace = TRUE)
Gmat <- matrix(rnorm(nf^2), nrow = nf, ncol = nf)
Bmat <- matrix(runif(mydim[2]*nf), nrow = mydim[2], ncol = nf)
Cmat <- matrix(runif(mydim[3]*nf), nrow = mydim[3], ncol = nf)
Xmat <- Emat <- Amat <- vector("list", mydim[3])
for(k in 1:mydim[3]){
  Amat[[k]] <- matrix(rnorm(nk[k]*nf), nrow = nk[k], ncol = nf)
  Amat[[k]] <- svd(Amat[[k]], nv = 0)$u %*% Gmat
  Xmat[[k]] <- tcrossprod(Amat[[k]] %*% diag(Cmat[k,]), Bmat)
  Emat[[k]] <- matrix(rnorm(nk[k]*mydim[2]), nrow = nk[k], ncol = mydim[2])
}
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR = 1
X <- mapply("+", Xmat, Emat)

# fit Parafac2 model (unconstrained)
pfac <- parafac2(X, nfac = nf, nstart = 1)
pfac

# check solution
Xhat <- fitted(pfac)
sse <- sumsq(mapply("-", Xmat, Xhat))
sse / (sum(nk) * mydim[2])
crossprod(pfac$A[[1]])
crossprod(pfac$A[[2]])
pfac$Phi

# reorder and resign factors
pfac$B[1:4,]
pfac <- reorder(pfac, 2:1)
pfac$B[1:4,]
pfac <- resign(pfac, mode="B")
pfac$B[1:4,]
Xhat <- fitted(pfac)
sse <- sumsq(mapply("-", Xmat, Xhat))
sse / (sum(nk) * mydim[2])

# rescale factors
colSums(pfac$B^2)
colSums(pfac$C^2)
pfac <- rescale(pfac, mode = "C", absorb = "B")
colSums(pfac$B^2)
colSums(pfac$C^2)
Xhat <- fitted(pfac)
sse <- sumsq(mapply("-", Xmat, Xhat))
sse / (sum(nk) * mydim[2])


##########   4-way example   ##########

# create random data list with Parafac2 structure
set.seed(4)
mydim <- c(NA, 10, 20, 5)
nf <- 3
nk <- sample(c(50,100,200), mydim[4], replace=TRUE)
Gmat <- matrix(rnorm(nf^2), nrow = nf, ncol = nf)
Bmat <- scale(matrix(rnorm(mydim[2]*nf), nrow = mydim[2], ncol = nf), center = FALSE)
cseq <- seq(-3, 3, length=mydim[3])
Cmat <- cbind(pnorm(cseq), pgamma(cseq+3.1, shape=1, rate=1)*(3/4), pt(cseq-2, df=4)*2)
Dmat <- scale(matrix(runif(mydim[4]*nf)*2, nrow = mydim[4], ncol = nf), center = FALSE)
Xmat <- Emat <- Amat <- vector("list",mydim[4])
for(k in 1:mydim[4]){
  aseq <- seq(-3, 3, length.out = nk[k])
  Amat[[k]] <- cbind(sin(aseq), sin(abs(aseq)), exp(-aseq^2))
  Amat[[k]] <- svd(Amat[[k]], nv = 0)$u %*% Gmat
  Xmat[[k]] <- array(tcrossprod(Amat[[k]] %*% diag(Dmat[k,]),
                                krprod(Cmat, Bmat)), dim = c(nk[k], mydim[2], mydim[3]))
  Emat[[k]] <- array(rnorm(nk[k] * mydim[2] * mydim[3]), dim = c(nk[k], mydim[2], mydim[3]))
}
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR = 1
X <- mapply("+", Xmat, Emat)

# fit Parafac model (smooth A, unconstrained B, monotonic C, non-negative D)
pfac <- parafac2(X, nfac = nf, nstart = 1, 
                 const = c("smooth", "uncons", "moninc", "nonneg"))
pfac

# check solution
Xhat <- fitted(pfac)
sse <- sumsq(mapply("-", Xmat, Xhat))
sse / (sum(nk) * mydim[2] * mydim[3])
crossprod(pfac$A[[1]])
crossprod(pfac$A[[2]])
pfac$Phi


## Not run: 
##D 
##D ##########   parallel computation   ##########
##D 
##D # create random data list with Parafac2 structure
##D set.seed(3)
##D mydim <- c(NA, 10, 20)
##D nf <- 2
##D nk <- sample(c(50, 100, 200), mydim[3], replace = TRUE)
##D Gmat <- matrix(rnorm(nf^2), nrow = nf, ncol = nf)
##D Bmat <- matrix(runif(mydim[2]*nf), nrow = mydim[2], ncol = nf)
##D Cmat <- matrix(runif(mydim[3]*nf), nrow = mydim[3], ncol = nf)
##D Xmat <- Emat <- Hmat <- vector("list", mydim[3])
##D for(k in 1:mydim[3]){
##D   Hmat[[k]] <- svd(matrix(rnorm(nk[k] * nf), nrow = nk[k], ncol = nf), nv = 0)$u
##D   Xmat[[k]] <- tcrossprod(Hmat[[k]] %*% Gmat %*% diag(Cmat[k,]), Bmat)
##D   Emat[[k]] <- matrix(rnorm(nk[k] * mydim[2]), nrow = nk[k], mydim[2])
##D }
##D Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR = 1
##D X <- mapply("+", Xmat, Emat)
##D 
##D # fit Parafac2 model (10 random starts -- sequential computation)
##D set.seed(1)
##D system.time({pfac <- parafac2(X, nfac = nf)})
##D pfac
##D 
##D # fit Parafac2 model (10 random starts -- parallel computation)
##D cl <- makeCluster(detectCores())
##D ce <- clusterEvalQ(cl, library(multiway))
##D clusterSetRNGStream(cl, 1)
##D system.time({pfac <- parafac2(X, nfac = nf, parallel = TRUE, cl = cl)})
##D pfac
##D stopCluster(cl)
## End(Not run)




