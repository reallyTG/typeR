library(bayess)


### Name: sumising
### Title: Approximation by path sampling of the normalising constant for
###   the Ising model
### Aliases: sumising
### Keywords: Ising model path sampling

### ** Examples

Z=seq(0,2,length=21)
for (i in 1:21)
  Z[i]=sumising(5,numb=24,beta=Z[i])
lrcst=approxfun(seq(0,2,length=21),Z)
plot(seq(0,2,length=21),Z,xlab="",ylab="")
curve(lrcst,0,2,add=TRUE)



