library(fda.usc)


### Name: fdata2fd
### Title: Converts fdata class object into fd class object
### Aliases: fdata2fd
### Keywords: manip

### ** Examples


data(phoneme)
mlearn<-phoneme$learn[1,]
fdata2=fdata2fd(mlearn)
class(mlearn)
class(fdata2)
fdata3=fdata2fd(mlearn,type.basis="fourier",nbasis=7)
plot(mlearn)
lines(fdata2,col=2)
lines(fdata3,col=3)
fdata5=fdata2fd(mlearn,nderiv=1)




