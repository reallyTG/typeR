library(asbio)


### Name: loess.surf
### Title: Loess 2D and 3D smooth plots
### Aliases: loess.surf
### Keywords: univar

### ** Examples

X1<-sort(rnorm(100))
X2<-rexp(100)
Y<-rgamma(100,1,2)
loess.surf(Y,cbind(X1,X2))



