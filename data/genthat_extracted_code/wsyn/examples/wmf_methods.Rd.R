library(wsyn)


### Name: wmf_methods
### Title: Basic methods for the 'wmf' class
### Aliases: wmf_methods summary.wmf print.wmf set_times.wmf
###   set_timescales.wmf set_values.wmf set_dat.wmf set_wtopt.wmf
###   get_times.wmf get_timescales.wmf get_values.wmf get_dat.wmf
###   get_wtopt.wmf

### ** Examples

times<-1:30 #generate time steps
#generate fake count data for 20 locations
dat<-matrix(rpois(20*length(times),20),nrow=20,ncol=length(times)) 
dat<-cleandat(dat=dat,times=times,clev=2)$cdat #detrend and demean
h<-wmf(dat,times)
get_times(h)
summary(h)
print(h)




