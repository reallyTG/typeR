library(robCompositions)


### Name: imputeBDLs
### Title: EM-based replacement of rounded zeros in compositional data
### Aliases: imputeBDLs print.replaced checkData adjustImputed
###   adjustImputed checkData print.replaced
### Keywords: manip multivariate

### ** Examples


p <- 10
n <- 50
k <- 2
T <- matrix(rnorm(n*k), ncol=k)
B <- matrix(runif(p*k,-1,1),ncol=k)
X <- T %*% t(B)
E <-  matrix(rnorm(n*p, 0,0.1), ncol=p)
XE <- X + E
data <- data.frame(pivotCoordInv(XE))
col <- ncol(data)
row <- nrow(data)
DL <- matrix(rep(0),ncol=col,nrow=1)
for(j in seq(1,col,2))
{DL[j] <- quantile(data[,j],probs=0.06,na.rm=FALSE)}

for(j in 1:col)        
{data[data[,j]<DL[j],j] <- 0}

imp <- imputeBDLs(data,dl=DL,maxit=10,eps=0.1,R=10,method="subPLS")
imp
imp <- imputeBDLs(data,dl=DL,maxit=10,eps=0.1,R=10,method="pls", variation = FALSE)
imp
imp <- imputeBDLs(data,dl=DL,maxit=10,eps=0.1,R=10,method="lm")
imp
imp <- imputeBDLs(data,dl=DL,maxit=10,eps=0.1,R=10,method="lmrob")
imp

data(mcad)
## Not run: 
##D ## longer computation times...
##D ## generate rounded zeros artificially:
##D x <- mcad
##D x <- x[1:25, 2:ncol(x)]
##D dl <- apply(x, 2, quantile, 0.1)
##D for(i in seq(1, ncol(x), 2)){
##D   x[x[,i] < dl[i], i] <- 0
##D } 
##D ni <- sum(x==0, na.rm=TRUE) 
##D ni/(ncol(x)*nrow(x)) * 100
##D dl[seq(2, ncol(x), 2)] <- 0
##D replaced_lm <- imputeBDLs(x, dl=dl, eps=1, method="lm",  
##D   verbose=FALSE, R=50, variation=TRUE)$x
##D replaced_lmrob <- imputeBDLs(x, dl=dl, eps=1, method="lmrob",  
##D   verbose=FALSE, R=50, variation=TRUE)$x
##D replaced_plsfull <- imputeBDLs(x, dl=dl, eps=1, 
##D   method="pls", verbose=FALSE, R=50, 
##D   variation=FALSE)$x 
## End(Not run)






