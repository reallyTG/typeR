library(AdapEnetClass)


### Name: Enet.wls
### Title: Elastic net based on the weighted data
### Aliases: Enet.wls
### Keywords: elastic net Kaplan-Meier weights

### ** Examples

#For full data typically used for AFT models (using imputeYn (2015) package).
dat<-data(n=100, p=10, r=0, b1=c(rep(5,5),rep(0,5)), sig=1, Cper=0)

#Enet.wls: Elastic net on the weighted data
enet<-Enet.wls(dat$x, dat$y, dat$delta)
## No test: 
enet
## End(No test)



