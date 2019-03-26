library(ConvergenceConcepts)


### Name: law.plot3d
### Title: Static 3D convergence in law
### Aliases: law.plot3d
### Keywords: dplot distribution htest

### ** Examples

rand <- function(n){(cumsum(rchisq(n,df=1))-(1:n))/sqrt(2*(1:n))}
data <- generate(randomgen=rand,nmax=300,M=2000)$data
law.plot3d(data,pnorm)



