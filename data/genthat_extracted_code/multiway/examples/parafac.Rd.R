library(multiway)


### Name: parafac
### Title: Parallel Factor Analysis-1
### Aliases: parafac
### Keywords: models multivariate

### ** Examples

##########   3-way example   ##########

# create random data array with Parafac structure
set.seed(3)
mydim <- c(50, 20, 5)
nf <- 3
Amat <- matrix(rnorm(mydim[1]*nf), nrow = mydim[1], ncol = nf)
Bmat <- matrix(runif(mydim[2]*nf), nrow = mydim[2], ncol = nf)
Cmat <- matrix(runif(mydim[3]*nf), nrow = mydim[3], ncol = nf)
Xmat <- tcrossprod(Amat, krprod(Cmat, Bmat))
Xmat <- array(Xmat, dim = mydim)
Emat <- array(rnorm(prod(mydim)), dim = mydim)
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR = 1
X <- Xmat + Emat

# fit Parafac model (unconstrained)
pfac <- parafac(X, nfac = nf, nstart = 1)
pfac

# fit Parafac model (non-negativity on Modes B and C)
pfacNN <- parafac(X, nfac = nf, nstart = 1, 
                  const = c("uncons", "nonneg", "nonneg"))
pfacNN

# check solution
Xhat <- fitted(pfac)
sum((Xmat - Xhat)^2) / prod(mydim)

# reorder and resign factors
pfac$B[1:4,]
pfac <- reorder(pfac, c(3,1,2))
pfac$B[1:4,]
pfac <- resign(pfac, mode="B")
pfac$B[1:4,]
Xhat <- fitted(pfac)
sum((Xmat - Xhat)^2) / prod(mydim)

# rescale factors
colSums(pfac$B^2)
colSums(pfac$C^2)
pfac <- rescale(pfac, mode = "C", absorb = "B")
colSums(pfac$B^2)
colSums(pfac$C^2)
Xhat <- fitted(pfac)
sum((Xmat - Xhat)^2) / prod(mydim)


##########   4-way example   ##########

# create random data array with Parafac structure
set.seed(4)
mydim <- c(30,10,8,10)
nf <- 4
aseq <- seq(-3, 3, length.out = mydim[1])
Amat <- cbind(dnorm(aseq), dchisq(aseq+3.1, df=3),
              dt(aseq-2, df=4), dgamma(aseq+3.1, shape=3, rate=1))
Bmat <- svd(matrix(runif(mydim[2]*nf), nrow = mydim[2], ncol = nf), nv = 0)$u
Cmat <- matrix(runif(mydim[3]*nf), nrow = mydim[3], ncol = nf)
Cstruc <- Cmat > 0.5
Cmat <- Cmat * Cstruc
Dmat <- matrix(runif(mydim[4]*nf), nrow = mydim[4], ncol = nf)
Xmat <- tcrossprod(Amat, krprod(Dmat, krprod(Cmat, Bmat)))
Xmat <- array(Xmat, dim = mydim)
Emat <- array(rnorm(prod(mydim)), dim = mydim)
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR = 1
X <- Xmat + Emat

# fit Parafac model (unimodal and smooth A, orthogonal B, 
#                    non-negative and structured C, non-negative D)
pfac <- parafac(X, nfac = nf, nstart = 1, Cstruc = Cstruc, 
                const = c("unismo", "orthog", "nonneg", "nonneg"))
pfac

# check solution
Xhat <- fitted(pfac)
sum((Xmat - Xhat)^2) / prod(mydim)
congru(Amat, pfac$A)
crossprod(pfac$B)
pfac$C
Cstruc

## Not run: 
##D 
##D ##########   parallel computation   ##########
##D 
##D # create random data array with Parafac structure
##D set.seed(3)
##D mydim <- c(50,20,5)
##D nf <- 3
##D Amat <- matrix(rnorm(mydim[1]*nf), nrow = mydim[1], ncol = nf)
##D Bmat <- matrix(runif(mydim[2]*nf), nrow = mydim[2], ncol = nf)
##D Cmat <- matrix(runif(mydim[3]*nf), nrow = mydim[3], ncol = nf)
##D Xmat <- tcrossprod(Amat, krprod(Cmat, Bmat))
##D Xmat <- array(Xmat, dim = mydim)
##D Emat <- array(rnorm(prod(mydim)), dim = mydim)
##D Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR = 1
##D X <- Xmat + Emat
##D 
##D # fit Parafac model (10 random starts -- sequential computation)
##D set.seed(1)
##D system.time({pfac <- parafac(X, nfac = nf)})
##D pfac
##D 
##D # fit Parafac model (10 random starts -- parallel computation)
##D cl <- makeCluster(detectCores())
##D ce <- clusterEvalQ(cl, library(multiway))
##D clusterSetRNGStream(cl, 1)
##D system.time({pfac <- parafac(X, nfac = nf, parallel = TRUE, cl = cl)})
##D pfac
##D stopCluster(cl)
## End(Not run)




