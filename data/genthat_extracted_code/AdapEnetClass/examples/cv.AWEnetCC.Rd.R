library(AdapEnetClass)


### Name: cv.AWEnetCC
### Title: Computes K-fold cross validated error curve for AEnetCC and
###   WEnetCC
### Aliases: cv.AWEnetCC
### Keywords: CV AEnetCC WEnetCC

### ** Examples

#For full data typically used for AFT models (using imputeYn (2015) package)
dat<-data(n=100, p=10, r=0, b1=c(rep(5,5),rep(0,5)), sig=1, Cper=0)

#This needs to run for generating weights of the observations
l<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=100, trace=FALSE, gehanonly=FALSE)

#cv.AWEnetCC: Cross validation of Adaptive elastic net with censoring constraints
wt<-l$enet
cv1cc<-cv.AWEnetCC(dat$x, dat$y, dat$delta, weight=wt, kFold = 10, C=1.2, s=0.88,
 lambda2=0.001, AEnetCC=TRUE)

#cv.AWEnetCC: Cross validation of weighted elastic net with censoring constraints
## Not run: l<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=100, trace=FALSE, gehanonly=TRUE)
## Not run: wt<-l$gehansd
## Not run: 
##D cv1cc<-cv.AWEnetCC(dat$x, dat$y, dat$delta, weight=wt, kFold = 10, C=1.2, s=0.88,
##D  lambda2=0.001, AEnetCC=F)
## End(Not run)



