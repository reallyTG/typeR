library(bayesm)


### Name: rivGibbs
### Title: Gibbs Sampler for Linear "IV" Model
### Aliases: rivGibbs
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

simIV = function(delta, beta, Sigma, n, z, w, gamma) {
  eps = matrix(rnorm(2*n),ncol=2) %*% chol(Sigma)
  x = z%*%delta + eps[,1]
  y = beta*x + eps[,2] + w%*%gamma
  list(x=as.vector(x), y=as.vector(y)) 
  }
  
n = 200
p=1 # number of instruments
z = cbind(rep(1,n), matrix(runif(n*p),ncol=p))
w = matrix(1,n,1)
rho = 0.8
Sigma = matrix(c(1,rho,rho,1), ncol=2)
delta = c(1,4)
beta = 0.5
gamma = c(1)
simiv = simIV(delta, beta, Sigma, n, z, w, gamma)

Data1 = list(); Data1$z = z; Data1$w=w; Data1$x=simiv$x; Data1$y=simiv$y
Mcmc1=list(); Mcmc1$R = R; Mcmc1$keep=1

out = rivGibbs(Data=Data1, Mcmc=Mcmc1)

cat("Summary of Beta draws", fill=TRUE)
summary(out$betadraw, tvalues=beta)

cat("Summary of Sigma draws", fill=TRUE)
summary(out$Sigmadraw, tvalues=as.vector(Sigma[upper.tri(Sigma,diag=TRUE)]))

## plotting examples
if(0){plot(out$betadraw)}



