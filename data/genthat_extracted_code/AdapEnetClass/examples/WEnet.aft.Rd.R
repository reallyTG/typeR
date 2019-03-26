library(AdapEnetClass)


### Name: WEnet.aft
### Title: Weighted elastic net for censored data based on AFT models
### Aliases: WEnet.aft
### Keywords: Weighted elastic net AFT models lars

### ** Examples

#For full data typically used for AFT models (using imputeYn (2015) package).
dat<-data(n=100, p=10, r=0, b1=c(rep(5,5),rep(0,5)), sig=1, Cper=0)

#This needs to run for generating weights of the observations
l<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=10, trace=FALSE, gehanonly=TRUE)

#WEnet.aft: weighted elastic net
wt<-round(l$gehansd)
ft.2<-WEnet.aft(dat$x, dat$y, dat$delta, weight=wt, lambda2=1, maxit=10)
## No test: 
ft.2
## End(No test)



