library(fda.usc)


### Name: S.basis
### Title: Smoothing matrix with roughness penalties by basis
###   representation.
### Aliases: S.basis
### Keywords: smooth

### ** Examples


np=101
tt=seq(0,1,len=np)

nbasis=11
base1 <- create.bspline.basis(c(0, np), nbasis)
base2 <- create.fourier.basis(c(0, np), nbasis)

S1<-S.basis(tt,basis=base1,lambda=3)
image(S1) 
S2<-S.basis(tt,basis=base2,lambda=3)
image(S2)





