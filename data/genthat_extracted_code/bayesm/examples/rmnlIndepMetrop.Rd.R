library(bayesm)


### Name: rmnlIndepMetrop
### Title: MCMC Algorithm for Multinomial Logit Model
### Aliases: rmnlIndepMetrop
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

simmnl = function(p, n, beta) {
  ## note: create X array with 2 alt.spec vars
    k = length(beta)
    X1 = matrix(runif(n*p,min=-1,max=1), ncol=p)
    X2 = matrix(runif(n*p,min=-1,max=1), ncol=p)
    X = createX(p, na=2, nd=NULL, Xd=NULL, Xa=cbind(X1,X2), base=1)
    Xbeta = X%*%beta 
  ## now do probs
    p = nrow(Xbeta) / n
    Xbeta = matrix(Xbeta, byrow=TRUE, ncol=p)
    Prob = exp(Xbeta)
    iota = c(rep(1,p))
    denom = Prob%*%iota
    Prob = Prob / as.vector(denom)
  ## draw y
    y = vector("double",n)
    ind = 1:p
    for (i in 1:n) { 
      yvec = rmultinom(1, 1, Prob[i,])
      y[i] = ind%*%yvec 
    }
  return(list(y=y, X=X, beta=beta, prob=Prob))
}

n = 200
p = 3
beta = c(1, -1, 1.5, 0.5)

simout = simmnl(p,n,beta)

Data1 = list(y=simout$y, X=simout$X, p=p)
Mcmc1 = list(R=R, keep=1)

out = rmnlIndepMetrop(Data=Data1, Mcmc=Mcmc1)

cat("Summary of beta draws", fill=TRUE)
summary(out$betadraw, tvalues=beta)

## plotting examples
if(0){plot(out$betadraw)}



