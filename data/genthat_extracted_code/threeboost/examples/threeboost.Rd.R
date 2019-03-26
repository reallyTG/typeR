library(threeboost)


### Name: threeboost
### Title: Thresholded EEBoost
### Aliases: threeboost

### ** Examples

library(Matrix)

# Generate some test data - uses 'mvtnorm' package
n <- 30
n.var <- 50
clust.size <- 4
B <- c(rep(2,5),rep(0.2,5),rep(0.05,10),rep(0,n.var-20))
mn.X <- rep(0,n.var)
sd.X <- 0.5
rho.X <- 0.3
cov.sig.X <- sd.X^2*((1-rho.X)*diag(rep(1,10)) + rho.X*matrix(data=1,nrow=10,ncol=10))
sig.X <- as.matrix( Matrix::bdiag(lapply(1:(n.var/10),function(x) { cov.sig.X } ) ) )
sd.Y <- 0.5
rho.Y <- 0.3
indiv.Sig <- sd.Y^2*( (1-rho.Y)*diag(rep(1,4)) + rho.Y*matrix(data=1,nrow=4,ncol=4) )
sig.list <- list(length=n)
for(i in 1:n) { sig.list[[i]] <- indiv.Sig }
Sig <- Matrix::bdiag(sig.list)
indiv.index <- rep(1:n,each=clust.size)
sig.Y <- as.matrix(Sig)
if(require(mvtnorm)) {
X <- mvtnorm::rmvnorm(n*clust.size,mean=mn.X,sigma=sig.X)
mn.Y <- X %*% B
## Correlated continuous outcome
Y <- mvtnorm::rmvnorm(1,mean=mn.Y,sigma=sig.Y)
} else { stop('Need mvtnorm package to generate correlated example data.') }

## Define the Gaussian GEE estimating function with independence working correlation
mu.Lin <- function(eta){eta}
g.Lin <- function(m){m}
v.Lin <- function(eta){rep(1,length(eta))}

 EE.fn.ind <- function(Y,X,b) {
 ee.GEE(Y,X,b,
 mu.Y=mu.Lin,
 g.Y=g.Lin,
 v.Y=v.Lin,
 aux=function(...) { ee.GEE.aux(...,mu.Y=mu.Lin,g.Y=g.Lin,v.Y=v.Lin) },
 id=indiv.index,
 corstr="ind")
}

## These two give the same result
coef.mat <- eeboost(Y,X,EE.fn.ind,maxit=250)
coef.mat2 <- geeboost(Y,X,id=indiv.index,family="gaussian",corstr="ind",maxit=250)$coefmat

par(mfrow=c(1,2))
coef_traceplot(coef.mat)
coef_traceplot(coef.mat2)



