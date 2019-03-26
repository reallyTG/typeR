library(bayesm)


### Name: rmvpGibbs
### Title: Gibbs Sampler for Multivariate Probit
### Aliases: rmvpGibbs
### Keywords: models multivariate

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

simmvp = function(X, p, n, beta, sigma) {
  w = as.vector(crossprod(chol(sigma),matrix(rnorm(p*n),ncol=n))) + X%*%beta
  y = ifelse(w<0, 0, 1)
  return(list(y=y, X=X, beta=beta, sigma=sigma))
}

p = 3
n = 500
beta = c(-2,0,2)
Sigma = matrix(c(1, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 1), ncol=3)
k = length(beta)
I2 = diag(rep(1,p))
xadd = rbind(I2)
for(i in 2:n) { xadd=rbind(xadd,I2) }
X = xadd

simout = simmvp(X,p,500,beta,Sigma)

Data1 = list(p=p, y=simout$y, X=simout$X)
Mcmc1 = list(R=R, keep=1)

out = rmvpGibbs(Data=Data1, Mcmc=Mcmc1)

ind = seq(from=0, by=p, length=k)
inda = 1:3
ind = ind + inda
cat(" Betadraws ", fill=TRUE)
betatilde = out$betadraw / sqrt(out$sigmadraw[,ind])
attributes(betatilde)$class = "bayesm.mat"
summary(betatilde, tvalues=beta/sqrt(diag(Sigma)))

rdraw = matrix(double((R)*p*p), ncol=p*p)
rdraw = t(apply(out$sigmadraw, 1, nmat))
attributes(rdraw)$class = "bayesm.var"
tvalue = nmat(as.vector(Sigma))
dim(tvalue) = c(p,p)
tvalue = as.vector(tvalue[upper.tri(tvalue,diag=TRUE)])
cat(" Draws of Correlation Matrix ", fill=TRUE)
summary(rdraw, tvalues=tvalue)

## plotting examples
if(0){plot(betatilde, tvalues=beta/sqrt(diag(Sigma)))}



