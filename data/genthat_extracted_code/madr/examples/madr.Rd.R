library(madr)


### Name: madr
### Title: Calculate model averaged double robust estimate
### Aliases: madr

### ** Examples

set.seed(122)
## generate data
n = 100 # number of observations
k = 4   # number of covariates
U = matrix(rnorm(n*k),n,k)
colnames(U) = paste0("U",1:k)
A = rbinom(n,1,expit(-1+.5*rowSums(U)))
Y = rnorm(n,1+A+.25*rowSums(U))

## A is confounded -- true effect is 1
lm(Y~A)

## fit ma-dr -- can enumerate models if k isnt too big
res = madr(Y=Y,X=A,U=U,enumerate=TRUE,tau=1,two.stage=FALSE) # independent prior
res

res = madr(Y=Y,X=A,U=U,enumerate=TRUE,tau=0,two.stage=TRUE) # tau=0 and using two-stage weights
res

## no need to refit madr each time when enumerating -- use summarize and specify different taus
summary(res,tau=1,two.stage=FALSE) # independent prior
summary(res,tau=0,two.stage=FALSE)
summary(res,tau=0,two.stage=TRUE) # two-stage procedure for calculating weights

## use mcmc instead of enumerating (the default)
madr(Y=Y,X=A,U=U,M=1000,cut=1) #should approximate tau=0 and two.stage=TRUE



