library(wsyn)


### Name: wpmf_methods
### Title: Basic methods for the 'wpmf' class
### Aliases: wpmf_methods summary.wpmf print.wpmf set_times.wpmf
###   set_timescales.wpmf set_values.wpmf set_dat.wpmf set_wtopt.wpmf
###   set_signif.wpmf get_times.wpmf get_timescales.wpmf get_values.wpmf
###   get_dat.wpmf get_wtopt.wpmf get_signif.wpmf

### ** Examples

times<-1:30 #generate time steps
#generate fake count data for 20 locations
dat<-matrix(rpois(20*length(times),20),nrow=20,ncol=length(times)) 
dat<-cleandat(dat=dat,times=times,clev=2)$cdat #detrend and demean
h<-wpmf(dat,times)
get_times(h)
summary(h)
print(h)




