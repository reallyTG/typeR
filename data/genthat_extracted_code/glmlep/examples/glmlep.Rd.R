library(glmlep)


### Name: glmlep
### Title: Fit a GLM wit LEP regularization
### Aliases: glmlep
### Keywords: LEP GLM EBIC

### ** Examples


## generate data
require(mvtnorm)
n = 100;
beta <- c(3,1.5,0,0,2,0,0,0)

set.seed(100)
p=length(beta);
corr_data=diag(rep(1,p));

x=as.matrix(rmvnorm(n,rep(0,p),corr_data))
noise=rnorm(n);

## Gaussian
y <- tcrossprod(x,t(beta)) + noise;
fit <- glmlep(x,y,family="gaussian")




