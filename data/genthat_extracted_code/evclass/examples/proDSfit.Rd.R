library(evclass)


### Name: proDSfit
### Title: Training of the evidential neural network classifier
### Aliases: proDSfit

### ** Examples

## Glass dataset
data(glass)
xapp<-glass$x[1:89,]
yapp<-glass$y[1:89]
xtst<-glass$x[90:185,]
ytst<-glass$y[90:185]
## Initialization
param0<-proDSinit(xapp,yapp,nproto=7)
## Training
fit<-proDSfit(xapp,yapp,param0)



