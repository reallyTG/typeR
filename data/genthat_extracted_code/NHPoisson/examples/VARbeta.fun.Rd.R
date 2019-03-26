library(NHPoisson)


### Name: VARbeta.fun
### Title: Covariance matrix of the \hat beta vector.
### Aliases: VARbeta.fun

### ** Examples


lambdafit<-runif(100,0,1)
X<-cbind(rep(1,100),rnorm(100),rnorm(100))

aux<-VARbeta.fun(covariates=X, lambdafit=lambdafit)





