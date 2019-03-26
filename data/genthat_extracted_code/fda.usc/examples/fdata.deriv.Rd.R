library(fda.usc)


### Name: fdata.deriv
### Title: Computes the derivative of functional data object.
### Aliases: fdata.deriv
### Keywords: manip

### ** Examples


data(tecator)
absorp=tecator$absorp.fdata
tecator.fd1=fdata2fd(absorp)
tecator.fd2=fdata2fd(absorp,"fourier",9)
tecator.fd3=fdata2fd(absorp,"fourier",nbasis=9,nderiv=1)
#tecator.fd1;tecator.fd2;tecator.fd3
tecator.fdata1=fdata(tecator.fd1)
tecator.fdata2=fdata(tecator.fd2)
tecator.fdata3=fdata(tecator.fd3)
tecator.fdata4=fdata.deriv(absorp,nderiv=1,method="bspline",
class.out='fdata',nbasis=9)
tecator.fd4=fdata.deriv(tecator.fd3,nderiv=0,class.out='fd',nbasis=9)
plot(tecator.fdata4)
plot(fdata.deriv(absorp,nderiv=1,method="bspline",class.out='fd',nbasis=11))



