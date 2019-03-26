library(bayesm)


### Name: rordprobitGibbs
### Title: Gibbs Sampler for Ordered Probit
### Aliases: rordprobitGibbs
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

## simulate data for ordered probit model

simordprobit=function(X, betas, cutoff){
  z = X%*%betas + rnorm(nobs)   
  y = cut(z, br = cutoff, right=TRUE, include.lowest = TRUE, labels = FALSE)  
  return(list(y = y, X = X, k=(length(cutoff)-1), betas= betas, cutoff=cutoff ))
}

nobs = 300 
X = cbind(rep(1,nobs),runif(nobs, min=0, max=5),runif(nobs,min=0, max=5))
k = 5
betas = c(0.5, 1, -0.5)       
cutoff = c(-100, 0, 1.0, 1.8, 3.2, 100)
simout = simordprobit(X, betas, cutoff) 
  
Data=list(X=simout$X, y=simout$y, k=k)

## set Mcmc for ordered probit model
   
Mcmc = list(R=R)   
out = rordprobitGibbs(Data=Data, Mcmc=Mcmc)

cat(" ", fill=TRUE)
cat("acceptance rate= ", accept=out$accept, fill=TRUE)
 
## outputs of betadraw and cut-off draws
  
cat(" Summary of betadraws", fill=TRUE)
summary(out$betadraw, tvalues=betas)
cat(" Summary of cut-off draws", fill=TRUE) 
summary(out$cutdraw, tvalues=cutoff[2:k])

## plotting examples
if(0){plot(out$cutdraw)}



