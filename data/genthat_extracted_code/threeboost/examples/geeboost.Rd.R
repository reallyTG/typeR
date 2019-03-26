library(threeboost)


### Name: geeboost
### Title: GEEBoost
### Aliases: geeboost

### ** Examples

# Generate some test data
library(mvtnorm)
library(Matrix)
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
Y <- mvtnorm::rmvnorm(1,mean=mn.Y,sigma=sig.Y) ## Correlated continuous outcomes
expit <- function(x) { exp(x) / (1 + exp(x)) }
## Correlated binary outcomes
Y.bin <- rbinom(n*clust.size,1,p=expit(mvtnorm::rmvnorm(1,mean=mn.Y,sigma=sig.Y)))
Y.pois <- rpois(length(Y),lambda=exp(mn.Y)) ## Correlated Poisson outcomes
} else { stop('Need mvtnorm package to generate correlated data.')}

## Run EEBoost (w/ indep working correlation)
results.lin <- geeboost(Y,X,id=indiv.index,maxit=1000)
## Not run: 
##D  results.bin <- geeboost(Y.bin,X,id=indiv.index,family="binomial",maxit=1000)
##D  results.pois <- geeboost(Y.pois,X,id=indiv.index,family="poisson",maxit=1000,traceplot=TRUE)
## End(Not run)

print(results.lin$final.model)



