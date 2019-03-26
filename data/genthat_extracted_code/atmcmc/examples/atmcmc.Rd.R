library(atmcmc)


### Name: atmcmc
### Title: Runs a MCMC algorithm tuned via adaption and corresponding
###   diagnostics
### Aliases: atmcmc

### ** Examples

dim = 3  #dimension of target density function
X0 = rep(0.1,dim)  #initial X value

tmpmat = rbind(c(-0.7, 1.2, 1.6),c(0.9, 1.1, -0.1),c(0.2, 0.3, -1.5))
targSigma = t(tmpmat) %*% tmpmat
targMean = c(22, -10,  15)
#log of target density function
g = function(X){-0.5*t(X-targMean)%*%solve(targSigma)%*%(X-targMean)}

output = atmcmc(g, dim, X0)
plotmcmc(output, name = "project1")
summarymcmc(output, name = "project1")



