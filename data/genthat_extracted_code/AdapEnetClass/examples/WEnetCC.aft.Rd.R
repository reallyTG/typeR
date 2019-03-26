library(AdapEnetClass)


### Name: WEnetCC.aft
### Title: Weighted elastic net with censoring constraints for censored
###   data based on AFT models
### Aliases: WEnetCC.aft
### Keywords: WEnetCC.aft AFT models lars

### ** Examples

#For full data typically used for AFT models (using imputeYn (2015) package)
dat<-data(n=100, p=10, r=0, b1=c(rep(5,5),rep(0,5)), sig=1, Cper=0)

#This needs to run for generating weights of the observations
l<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=10, trace=FALSE, gehanonly=TRUE)

#WEnetCC.aft: weighted elastic net with censoring constraints
wt<-round(l$gehansd)
ft<-WEnetCC.aft(dat$x, dat$y, dat$delta, weight=wt, C=1, s=959596, lambda2=0.5)
## No test: 
ft
## End(No test)



