library(ald)


### Name: likALD
### Title: Log-Likelihood function for the Asymmetric Laplace Distribution
### Aliases: likALD
### Keywords: asymmetric laplace distribution quantile regression Laplace
###   Log-likelihood likelihood ALD

### ** Examples

## Let's compute the log-likelihood for a given sample

y = rALD(n=1000)
loglik = likALD(y)

#Changing the true parameters the loglik must decrease
loglik2 = likALD(y,mu=10,sigma=2,p=0.3)

loglik;loglik2
if(loglik>loglik2){print("First parameters are Better")}



