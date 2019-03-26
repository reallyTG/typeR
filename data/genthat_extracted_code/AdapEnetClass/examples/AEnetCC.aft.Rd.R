library(AdapEnetClass)


### Name: AEnetCC.aft
### Title: Adaptive elastic net for AFT models with censoring constraints
### Aliases: AEnetCC.aft
### Keywords: AEnetCC.aft AFT models lars

### ** Examples

#For full data typically used for AFT models (using imputeYn (2015) package).
dat<-data(n=100, p=10, r=0, b1=c(rep(5,5), rep(0, 5)), sig=1, Cper=0)

#This needs to run for generating weights of the observations
l<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=100, trace=FALSE, gehanonly=FALSE)

#AEnetCC.aft: adaptive elastic net with censoring constraints
wt<-round(l$enet,3)
ft<-AEnetCC.aft(dat$x, dat$y, dat$delta, weight=wt, C=1, s=959596, lambda2=0.5)
## No test: 
ft
## End(No test)



