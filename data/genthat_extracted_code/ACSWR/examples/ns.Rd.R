library(ACSWR)


### Name: ns
### Title: Simulated Sample from Normal Distribution
### Aliases: ns
### Keywords: maximum likelihood estimation

### ** Examples

library(stats4)
data(ns)
x <- ns[,1]
nlogl <- function(mean,sd) { -sum(dnorm(x,mean=mean,sd=sd,log=TRUE)) }
norm_mle <- mle(nlogl,start=list(mean=median(x),sd=IQR(x)),nobs=length(x))
summary(norm_mle)



