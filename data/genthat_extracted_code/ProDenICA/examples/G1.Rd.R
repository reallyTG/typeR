library(ProDenICA)


### Name: G1
### Title: FastICA contrast functions.
### Aliases: G1 G0
### Keywords: distribution

### ** Examples
p=2
### Can use letters a-r below for dist
dist="n" 
N=1024
A0<-mixmat(p)
s<-scale(cbind(rjordan(dist,N),rjordan(dist,N)))
x <- s %*% A0
fit=ProDenICA(x,Gfunc=G1, whiten=TRUE)



