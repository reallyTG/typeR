library(AdapEnetClass)


### Name: AdapEnetClass-package
### Title: A Class of Adaptive Elastic Net Methods for Censored Data
### Keywords: lars imputeYn

### ** Examples

#For full data typically used for AFT models (using imputeYn (2015) package)
dat<-data(n=100, p=10, r=0, b1=c(rep(5,5),rep(0,5)), sig=1, Cper=0)

#mrbj: modified resampling based buckley-james
l<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=100, trace=FALSE, gehanonly=FALSE)

#AEnet.aft: adaptive elastic net
wt<-round(l$enet)
ft.1<-AEnet.aft(dat$x, dat$y, dat$delta, weight=wt, lambda2=1, maxit=10)

#AEnetCC.aft: adaptive elastic net with censoring constraints
## Not run: 
##D ft.1cc<-AEnetCC.aft(dat$x, dat$y, dat$delta, weight=wt, C=1, 
##D s = 0.959596, lambda2=0.5)
## End(Not run)

#WEnet.aft: weighted elastic net
#mrbj: modified resampling based buckley-james
## Not run: l<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=100, trace=FALSE, gehanonly=TRUE)
## Not run: wt<-l$gehansd
## Not run: ft.2<-WEnet.aft(dat$x, dat$y, dat$delta, weight=wt, lambda2=0.5, maxit=10)

#WEnetCC.aft: weighted elastic net with censoring constraints
## Not run: ft.2cc<-WEnetCC.aft(dat$x, dat$y, dat$delta, weight=wt, C=1, s = 1, lambda2=0.5)



