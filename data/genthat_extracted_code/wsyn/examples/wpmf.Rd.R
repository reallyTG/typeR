library(wsyn)


### Name: wpmf
### Title: Wavelet phasor mean field
### Aliases: wpmf

### ** Examples

times<-1:30 #generate time steps
#generate fake count data for 20 locations
dat<-matrix(rpois(20*length(times),20),nrow=20,ncol=length(times)) 
dat<-cleandat(dat=dat,times=times,clev=2)$cdat #detrend and demean
res<-wpmf(dat,times)




