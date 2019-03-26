library(KODAMA)


### Name: MetRef
### Title: Nuclear Magnetic Resonance Spectra of Urine Samples
### Aliases: MetRef
### Keywords: datasets

### ** Examples

data(MetRef)
u=MetRef$data;
u=u[,-which(colSums(u)==0)]
u=normalization(u)$newXtrain
u=scaling(u)$newXtrain
class=as.numeric(as.factor(MetRef$gender))
cc= prcomp(u)$x
plot(cc,pch=21,bg=class,xlab="First Component",ylab="Second Component")

class=as.numeric(as.factor(MetRef$donor))
plot(cc,pch=21,bg=rainbow(22)[class],xlab="First Component",ylab="Second Component")

#
# kk=KODAMA(u)
# plot(kk$pp,pch=21,bg=rainbow(22)[class],xlab="First Component",ylab="Second Component")
#




