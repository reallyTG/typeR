library(AdapEnetClass)


### Name: cv.AWEnet
### Title: Computes K-fold cross validated error curve for AEnet and WEnet
### Aliases: cv.AWEnet
### Keywords: CV AEnet WEnet

### ** Examples

#For full data typically used for AFT models (using imputeYn (2015) package).
dat<-data(n=100, p=10, r=0, b1=c(rep(5,5),rep(0,5)), sig=1, Cper=0)

#This needs to run for generating weights of the observations
l<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=100, trace=FALSE, gehanonly=FALSE)

#cv.AWEnet: Cross validation of Adaptive elastic net
wt<-l$enet
## Not run: 
##D cv1 <-cv.AWEnet(dat$x, dat$y, dat$delta, weight=wt, lambda2=0.001, maxit=10,
##D plot.it = T, AEnet=T)
## End(Not run)
## Not run: cv1$index[which.min(cv1$cv)]

#cv.AWEnet: Cross validation of weighted elastic net
## Not run: l<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=100, trace=FALSE, gehanonly=TRUE)
## Not run: wt<-l$gehansd
## Not run: 
##D cv2 <-cv.AWEnet(dat$x, dat$y, dat$delta, weight=wt, lambda2=0.001, 
##D maxit=10, plot.it = T, AEnet=F)
## End(Not run)
## Not run: cv2$index[which.min(cv2$cv)]



