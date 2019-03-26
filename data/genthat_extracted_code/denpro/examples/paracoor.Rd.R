library(denpro)


### Name: paracoor
### Title: Makes a parallel coordinate plot
### Aliases: paracoor
### Keywords: multivariate

### ** Examples

X<-sim.data(n=100,type="mulmod")
paracoor(X)

set.seed(1)
X<-matrix(rnorm(300),100,3)
paracoor(X)

set.seed(1)
X<-matrix(rnorm(400),100,4)
paracoor(X)




