library(multiway)


### Name: corcondia
### Title: Core Consistency Diagnostic
### Aliases: corcondia

### ** Examples

##########   EXAMPLE   ##########

# create random data array with Parafac structure
set.seed(3)
mydim <- c(50,20,5)
nf <- 2
Amat <- matrix(rnorm(mydim[1]*nf),mydim[1],nf)
Bmat <- matrix(runif(mydim[2]*nf),mydim[2],nf)
Cmat <- matrix(runif(mydim[3]*nf),mydim[3],nf)
Xmat <- array(tcrossprod(Amat,krprod(Cmat,Bmat)),dim=mydim)
Emat <- array(rnorm(prod(mydim)),dim=mydim)
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR=1
X <- Xmat + Emat

# fit Parafac model (1-4 factors)
pfac1 <- parafac(X,nfac=1,nstart=1)
pfac2 <- parafac(X,nfac=2,nstart=1)
pfac3 <- parafac(X,nfac=3,nstart=1)
pfac4 <- parafac(X,nfac=4,nstart=1)

# check corcondia
corcondia(X, pfac1)
corcondia(X, pfac2)
corcondia(X, pfac3)
corcondia(X, pfac4)




