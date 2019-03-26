library(nnls)


### Name: nnnpls
### Title: An implementation of least squares with non-negative and
###   non-positive constraints
### Aliases: nnnpls
### Keywords: optimize

### ** Examples

## simulate a matrix A
## with 3 columns, each containing an exponential decay 
t <- seq(0, 2, by = .04)
k <- c(.5, .6, 1)
A <- matrix(nrow = 51, ncol = 3)
Acolfunc <- function(k, t) exp(-k*t)
for(i in 1:3) A[,i] <- Acolfunc(k[i],t)

## simulate a matrix X
## with 3 columns, each containing a Gaussian shape 
## 2 of the Gaussian shapes are non-negative and 1 is non-positive 
X <- matrix(nrow = 51, ncol = 3)
wavenum <- seq(18000,28000, by=200)
location <- c(25000, 22000, 20000) 
delta <- c(3000,3000,3000)
Xcolfunc <- function(wavenum, location, delta)
  exp( - log(2) * (2 * (wavenum - location)/delta)^2)
for(i in 1:3) X[,i] <- Xcolfunc(wavenum, location[i], delta[i])
X[,2] <- -X[,2]

## set seed for reproducibility
set.seed(3300)

## simulated data is the product of A and X with some
## spherical Gaussian noise added 
matdat <- A %*% t(X) + .005 * rnorm(nrow(A) * nrow(X))

## estimate the rows of X using NNNPLS criteria 
nnnpls_sol <- function(matdat, A) {
  X <- matrix(0, nrow = 51, ncol = 3)
  for(i in 1:ncol(matdat)) 
     X[i,] <- coef(nnnpls(A,matdat[,i],con=c(1,-1,1)))
  X
}
X_nnnpls <- nnnpls_sol(matdat,A) 

## Not run: 
##D  
##D ## can solve the same problem with L-BFGS-B algorithm
##D ## but need starting values for x and 
##D ## impose a very low/high bound where none is desired
##D bfgs_sol <- function(matdat, A) {
##D   startval <- rep(0, ncol(A))
##D   fn1 <- function(par1, b, A) sum( ( b - A %*% par1)^2)
##D   X <- matrix(0, nrow = 51, ncol = 3)
##D   for(i in 1:ncol(matdat))  
##D     X[i,] <-  optim(startval, fn = fn1, b=matdat[,i], A=A,
##D               lower=rep(0, -1000, 0), upper=c(1000,0,1000),
##D               method="L-BFGS-B")$par
##D     X
##D }
##D X_bfgs <- bfgs_sol(matdat,A) 
##D 
##D ## the RMS deviation under NNNPLS is less than under L-BFGS-B 
##D sqrt(sum((X - X_nnnpls)^2)) < sqrt(sum((X - X_bfgs)^2))
##D 
##D ## and L-BFGS-B is much slower 
##D system.time(nnnpls_sol(matdat,A))
##D system.time(bfgs_sol(matdat,A))
##D 
##D ## can also solve the same problem by reformulating it as a
##D ## quadratic program (this requires the quadprog package; if you
##D ## have quadprog installed, uncomment lines below starting with
##D ## only 1 "#" )
##D 
##D # library(quadprog)
##D 
##D # quadprog_sol <- function(matdat, A) {
##D #  X <- matrix(0, nrow = 51, ncol = 3)
##D #  bvec <- rep(0, ncol(A))
##D #  Dmat <- crossprod(A,A)
##D #  Amat <- diag(c(1,-1,1))
##D #  for(i in 1:ncol(matdat)) { 
##D #    dvec <- crossprod(A,matdat[,i]) 
##D #    X[i,] <- solve.QP(dvec = dvec, bvec = bvec, Dmat=Dmat,
##D #                      Amat=Amat)$solution
##D #  }
##D #  X
##D # }
##D # X_quadprog <- quadprog_sol(matdat,A) 
##D 
##D ## the RMS deviation under NNNPLS is about the same as under quadprog 
##D # sqrt(sum((X - X_nnnpls)^2))
##D # sqrt(sum((X - X_quadprog)^2))
##D 
##D ## and quadprog requires about the same amount of time 
##D # system.time(nnnpls_sol(matdat,A))
##D # system.time(quadprog_sol(matdat,A))
## End(Not run)



