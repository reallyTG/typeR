library(ConvergenceConcepts)


### Name: law.plot2d
### Title: Interactive 2D convergence in law
### Aliases: law.plot2d
### Keywords: dplot iplot distribution htest

### ** Examples

rand <- function(n){(cumsum(rchisq(n,df=1))-(1:n))/sqrt(2*(1:n))}
data <- generate(randomgen=rand,nmax=1000,M=500)$data
law.plot2d(data)



