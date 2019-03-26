library(psych)


### Name: cortest.mat
### Title: Chi square tests of whether a single matrix is an identity
###   matrix, or a pair of matrices are equal.
### Aliases: cortest.normal cortest.mat cortest.jennrich cortest
### Keywords: multivariate

### ** Examples

x <- matrix(rnorm(1000),ncol=10)
cortest.normal(x)  #just test if this matrix is an identity
x <- sim.congeneric(loads =c(.9,.8,.7,.6,.5),N=1000,short=FALSE)
y <- sim.congeneric(loads =c(.9,.8,.7,.6,.5),N=1000,short=FALSE)
cortest.normal(x$r,y$r,n1=1000,n2=1000) #The Steiger test
cortest.jennrich(x$r,y$r,n1=100,n2=1000) # The Jennrich test
cortest.mat(x$r,y$r,n1=1000,n2=1000)   #twice the degrees of freedom as the Jennrich





