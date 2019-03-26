library(bayesm)


### Name: rivDP
### Title: Linear "IV" Model with DP Process Prior for Errors
### Aliases: rivDP
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

## simulate scaled log-normal errors and run
k = 10
delta = 1.5
Sigma = matrix(c(1, 0.6, 0.6, 1), ncol=2)
N = 1000
tbeta = 4
scalefactor = 0.6
root = chol(scalefactor*Sigma)
mu = c(1,1)

## compute interquartile ranges
ninterq = qnorm(0.75) - qnorm(0.25)
error = matrix(rnorm(100000*2), ncol=2)%*%root
error = t(t(error)+mu)
Err = t(t(exp(error))-exp(mu+0.5*scalefactor*diag(Sigma)))
lnNinterq = quantile(Err[,1], prob=0.75) - quantile(Err[,1], prob=0.25)

## simulate data
error = matrix(rnorm(N*2), ncol=2)%*%root
error = t(t(error)+mu)
Err = t(t(exp(error))-exp(mu+0.5*scalefactor*diag(Sigma)))

## scale appropriately  
Err[,1] = Err[,1]*ninterq/lnNinterq
Err[,2] = Err[,2]*ninterq/lnNinterq
z = matrix(runif(k*N), ncol=k)
x = z%*%(delta*c(rep(1,k))) + Err[,1]
y = x*tbeta + Err[,2]

## specify data input and mcmc parameters
Data = list(); 
Data$z = z
Data$x = x
Data$y = y

Mcmc = list()
Mcmc$maxuniq = 100
Mcmc$R = R
end = Mcmc$R

out = rivDP(Data=Data, Mcmc=Mcmc)

cat("Summary of Beta draws", fill=TRUE)
summary(out$betadraw, tvalues=tbeta)

## plotting examples
if(0){
  plot(out$betadraw, tvalues=tbeta)
  plot(out$nmix)  # plot "fitted" density of the errors
}



