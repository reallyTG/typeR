library(CNLTreg)


### Name: denoisepermCh
### Title: Denoises a signal using the complex-valued lifting transform and
###   multivariate soft thresholding and heteroscedastic variance
###   computation
### Aliases: denoisepermCh
### Keywords: methods regression

### ** Examples


library(MASS)	# where the motorcyle data lives

mcycleu<-mcycle[which(duplicated(mcycle$times)=='FALSE'),]
time<-mcycleu[,1]
accel<-mcycleu[,2]

set.seed(200)
est1<-denoisepermCh(time,accel)




