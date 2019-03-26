library(evclass)


### Name: proDSval
### Title: Classification of a test set by the evidential neural network
###   classifier
### Aliases: proDSval

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
## Test
val<-proDSval(xtst,fit$param,ytst)
## Confusion matrix
table(ytst,val$ypred)



