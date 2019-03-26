library(bayesm)


### Name: rmnpGibbs
### Title: Gibbs Sampler for Multinomial Probit
### Aliases: rmnpGibbs
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

simmnp = function(X, p, n, beta, sigma) {
  indmax = function(x) {which(max(x)==x)}
  Xbeta = X%*%beta
  w = as.vector(crossprod(chol(sigma),matrix(rnorm((p-1)*n),ncol=n))) + Xbeta
  w = matrix(w, ncol=(p-1), byrow=TRUE)
  maxw = apply(w, 1, max)
  y = apply(w, 1, indmax)
  y = ifelse(maxw < 0, p, y)
  return(list(y=y, X=X, beta=beta, sigma=sigma))
}

p = 3
n = 500
beta = c(-1,1,1,2)
Sigma = matrix(c(1, 0.5, 0.5, 1), ncol=2)
k = length(beta)
X1 = matrix(runif(n*p,min=0,max=2),ncol=p)
X2 = matrix(runif(n*p,min=0,max=2),ncol=p)
X = createX(p, na=2, nd=NULL, Xa=cbind(X1,X2), Xd=NULL, DIFF=TRUE, base=p)

simout = simmnp(X,p,500,beta,Sigma)

Data1 = list(p=p, y=simout$y, X=simout$X)
Mcmc1 = list(R=R, keep=1)

out = rmnpGibbs(Data=Data1, Mcmc=Mcmc1)

cat(" Summary of Betadraws ", fill=TRUE)
betatilde = out$betadraw / sqrt(out$sigmadraw[,1])
attributes(betatilde)$class = "bayesm.mat"
summary(betatilde, tvalues=beta)

cat(" Summary of Sigmadraws ", fill=TRUE)
sigmadraw = out$sigmadraw / out$sigmadraw[,1]
attributes(sigmadraw)$class = "bayesm.var"
summary(sigmadraw, tvalues=as.vector(Sigma[upper.tri(Sigma,diag=TRUE)]))

## plotting examples
if(0){plot(betatilde,tvalues=beta)}



