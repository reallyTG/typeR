library(wsyn)


### Name: wmf
### Title: Computes the wavelet mean field from a matrix of spatiotemporal
###   data. Also the creator function for the 'wmf' class.
### Aliases: wmf

### ** Examples

times<-1:30 #generate time steps
#generate fake count data for 20 locations
dat<-matrix(rpois(20*length(times),20),nrow=20,ncol=length(times)) 
dat<-cleandat(dat=dat,times=times,clev=2)$cdat #detrend and demean
wmf<-wmf(dat,times)




