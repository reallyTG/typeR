library(multiway)


### Name: mcr
### Title: Multiway Covariates Regression
### Aliases: mcr
### Keywords: models multivariate regression

### ** Examples


##########   multiway covariates regression   ##########

# create random data array with Parafac structure
set.seed(3)
mydim <- c(10, 20, 100)
nf <- 2
Amat <- matrix(rnorm(mydim[1]*nf), mydim[1], nf)
Bmat <- matrix(rnorm(mydim[2]*nf), mydim[2], nf)
Cmat <- matrix(rnorm(mydim[3]*nf), mydim[3], nf)
Xmat <- tcrossprod(Amat, krprod(Cmat, Bmat))
Xmat <- array(Xmat, dim = mydim)
EX <- array(rnorm(prod(mydim)), dim = mydim)
EX <- nscale(EX, 0, ssnew = sumsq(Xmat))   # SNR = 1
X <- Xmat + EX

# create response array
ydim <- c(mydim[3], 4)
Dmat <- matrix(rnorm(ydim[2]*nf), ydim[2], nf)
Ymat <- tcrossprod(Cmat, Dmat)
EY <- array(rnorm(prod(ydim)), dim = ydim)
EY <- nscale(EY, 0, ssnew = sumsq(Ymat))   # SNR = 1
Y <- Ymat + EY

# fit MCR model
mcr(X, Y, nfac = nf, nstart = 1)
mcr(X, Y, nfac = nf, nstart = 1, model = "parafac2")
mcr(X, Y, nfac = nf, nstart = 1, model = "tucker")



## Not run: 
##D 
##D ##########   parallel computation   ##########
##D 
##D # create random data array with Parafac structure
##D set.seed(3)
##D mydim <- c(10, 20, 100)
##D nf <- 2
##D Amat <- matrix(rnorm(mydim[1]*nf), mydim[1], nf)
##D Bmat <- matrix(rnorm(mydim[2]*nf), mydim[2], nf)
##D Cmat <- matrix(rnorm(mydim[3]*nf), mydim[3], nf)
##D Xmat <- tcrossprod(Amat, krprod(Cmat, Bmat))
##D Xmat <- array(Xmat, dim = mydim)
##D EX <- array(rnorm(prod(mydim)), dim = mydim)
##D EX <- nscale(EX, 0, ssnew = sumsq(Xmat))   # SNR = 1
##D X <- Xmat + EX
##D 
##D # create response array
##D ydim <- c(mydim[3], 4)
##D Dmat <- matrix(rnorm(ydim[2]*nf), ydim[2], nf)
##D Ymat <- tcrossprod(Cmat, Dmat)
##D EY <- array(rnorm(prod(ydim)), dim = ydim)
##D EY <- nscale(EY, 0, ssnew = sumsq(Ymat))   # SNR = 1
##D Y <- Ymat + EY
##D 
##D # fit MCR-Parafac model (10 random starts -- sequential computation)
##D set.seed(1)
##D system.time({mod <- mcr(X, Y, nfac = nf)})
##D mod
##D 
##D # fit MCR-Parafac model (10 random starts -- parallel computation)
##D cl <- makeCluster(detectCores())
##D ce <- clusterEvalQ(cl, library(multiway))
##D clusterSetRNGStream(cl, 1)
##D system.time({mod <- mcr(X, Y, nfac = nf, parallel = TRUE, cl = cl)})
##D mod
##D stopCluster(cl)
##D 
## End(Not run)





