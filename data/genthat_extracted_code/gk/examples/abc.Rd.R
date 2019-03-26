library(gk)


### Name: abc
### Title: Approximate Bayesian computation inference
### Aliases: abc

### ** Examples

set.seed(1)
x = rgk(10, A=3, B=1, g=2, k=0.5) ##An unusually small dataset for fast execution of this example
rprior = function(n) { matrix(runif(4*n,0,10), ncol=4) }
abc(x, N=1E4, rprior=rprior, M=100)



