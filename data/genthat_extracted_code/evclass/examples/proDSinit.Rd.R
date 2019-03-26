library(evclass)


### Name: proDSinit
### Title: Initialization of parameters for the evidential neural network
###   classifier
### Aliases: proDSinit

### ** Examples

## Glass dataset
data(glass)
xapp<-glass$x[1:89,]
yapp<-glass$y[1:89]
param0<-proDSinit(xapp,yapp,nproto=7)
param0



