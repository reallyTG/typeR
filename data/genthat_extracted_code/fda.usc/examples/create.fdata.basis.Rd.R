library(fda.usc)


### Name: create.fdata.basis
### Title: Create Basis Set for Functional Data of fdata class
### Aliases: create.fdata.basis create.pc.basis create.pls.basis
###   create.raw.fdata
### Keywords: multivariate

### ** Examples

data(tecator)
basis.pc<-create.pc.basis(tecator$absorp.fdata,c(1,4,5))
plot(basis.pc$basis,col=1)
basis.pls<-create.pls.basis(tecator$absorp.fdata,y=tecator$y[,1],c(1,4,5))
lines(basis.pls$basis,col=2)

basis.fd<-create.fdata.basis(tecator$absorp.fdata,c(1,4,5),
type.basis="fourier")
plot(basis.pc$basis)
basis.fdata<-create.fdata.basis(tecator$absorp.fdata,c(1,4,5),
type.basis="fourier",class.out="fdata")
plot(basis.fd,col=2,lty=1)
lines(basis.fdata,col=3,lty=1)



