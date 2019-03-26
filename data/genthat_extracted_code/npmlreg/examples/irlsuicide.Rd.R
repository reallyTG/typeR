library(npmlreg)


### Name: irlsuicide
### Title: Irish Suicide Data
### Aliases: irlsuicide
### Keywords: datasets

### ** Examples

data(irlsuicide)
library(lattice)
trellis.device(color=FALSE)
plot2age<-rep(gl(4,2),13)
xyplot(irlsuicide$death/irlsuicide$pop~plot2age|irlsuicide$Region, 
    pch=(1+(irlsuicide$sex==1)),xlab="age",ylab="Crude rates")





