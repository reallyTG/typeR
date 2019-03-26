library(AdapEnetClass)


### Name: AEnet.aft
### Title: Adaptive elastic net for censored data based on AFT models
### Aliases: AEnet.aft
### Keywords: Adaptive elastic net AFT models lars

### ** Examples

#For full data typically used for AFT models (using imputeYn (2015) package).
dat<-data(n=100, p=10, r=0, b1=c(rep(5,5),rep(0,5)), sig=1, Cper=0)

#This needs to run for generating weights of the observations
l<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=100, trace=FALSE, gehanonly=FALSE)

#AEnet.aft: adaptive elastic net
wt<-round(l$enet)
ft.1<-AEnet.aft(dat$x, dat$y, dat$delta, weight=wt, lambda2=1, maxit=10)
## No test: 
ft.1
## End(No test)



