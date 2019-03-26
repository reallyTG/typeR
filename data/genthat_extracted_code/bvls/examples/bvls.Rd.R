library(bvls)


### Name: bvls
### Title: The Stark-Parker implementation of bounded-variable least
###   squares
### Aliases: bvls
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
X <- matrix(nrow = 50, ncol = 3) 
wavenum <- seq(18000,28000, length=nrow(X))
location <- c(25000, 22000) 
delta <- c(1000,1000)
Xcolfunc <- function(wavenum, location, delta)
  exp( - log(2) * (2 * (wavenum - location)/delta)^2)
for(i in 1:2) X[,i] <- Xcolfunc(wavenum, location[i], delta[i])

X[1:40,3] <- Xcolfunc(wavenum, 23000, 1000)[11:nrow(X)]
X[41:nrow(X),3]<- - Xcolfunc(wavenum, 23000, 1000)[21:30]

## set seed for reproducibility
set.seed(3300)

## simulated data is the product of A and X with some
## spherical Gaussian noise added 
matdat <- A %*% t(X) + .005 * rnorm(nrow(A) * nrow(X))

## estimate the rows of X using BVLS criteria 
bvls_sol <- function(matdat, A) {
  X <- matrix(0, nrow = ncol(matdat), ncol = ncol(A) )
  bu <- c(Inf,Inf,.75)
  bl <- c(0,0,-.75)
  for(i in 1:ncol(matdat)) 
     X[i,] <- coef(bvls(A,matdat[,i], bl, bu))
  X
}
X_bvls <- bvls_sol(matdat,A) 

matplot(X,type="p",pch=20)
matplot(X_bvls,type="l",pch=20,add=TRUE)
legend(10, -.5,
c("bound <= zero", "bound <= zero", "bound <= -.75 <= .75"),
col = c(1,2,3), lty=c(1,2,3),
text.col = "blue")

## Not run: 
##D  
##D ## can solve the same problem with L-BFGS-B algorithm
##D ## but need starting values for x 
##D bfgs_sol <- function(matdat, A) {
##D   startval <- rep(0, ncol(A))
##D   fn1 <- function(par1, b, A) sum( ( b - A %*% par1)^2)
##D   X <- matrix(0, nrow = ncol(matdat), ncol = 3)
##D   bu <- c(1000,1000,.75)
##D   bl <- c(0,0,-.75)
##D   for(i in 1:ncol(matdat))  
##D     X[i,] <-  optim(startval, fn = fn1, b=matdat[,i], A=A,
##D                   upper = bu, lower = bl,
##D                   method="L-BFGS-B")$par
##D     X
##D }
##D X_bfgs <- bfgs_sol(matdat,A) 
##D 
##D ## the RMS deviation under BVLS is less than under L-BFGS-B 
##D sqrt(sum((X - X_bvls)^2)) < sqrt(sum((X - X_bfgs)^2))
##D 
##D ## and L-BFGS-B is much slower 
##D system.time(bvls_sol(matdat,A))
##D system.time(bfgs_sol(matdat,A))
## End(Not run)



