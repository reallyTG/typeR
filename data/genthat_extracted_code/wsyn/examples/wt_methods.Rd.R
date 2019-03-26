library(wsyn)


### Name: wt_methods
### Title: Basic methods for the 'wt' class
### Aliases: wt_methods summary.wt print.wt set_times.wt set_timescales.wt
###   set_values.wt set_dat.wt set_wtopt.wt get_times.wt get_timescales.wt
###   get_values.wt get_dat.wt get_wtopt.wt

### ** Examples

time1<-1:100
time2<-101:200
ts1p1<-sin(2*pi*time1/15)
ts1p2<-0*time1
ts2p1<-0*time2
ts2p2<-sin(2*pi*time2/8)
ts1<-ts1p1+ts1p2
ts2<-ts2p1+ts2p2
ts<-c(ts1,ts2)
ra<-rnorm(200,mean=0,sd=0.5)
t.series<-ts+ra
t.series<-t.series-mean(t.series)
times<-c(time1,time2)
h<-wt(t.series, times)
get_times(h)
summary(h)
print(h)




