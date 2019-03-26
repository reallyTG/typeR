library(perARMA)


### Name: perpacf
### Title: Periodic PACF function
### Aliases: perpacf ppfcoeffab ppfplot
### Keywords: perpacf

### ** Examples

 data(volumes)
 perpacf_out<-perpacf(t(volumes),24,12,NaN)
 ppa=perpacf_out$ppa
 nsamp=perpacf_out$nsamp
 ppfcoeffab(ppa,nsamp,1,'volumes')
 ppfplot(ppa,41,.05,'volumes')



