library(tsvr)


### Name: tsvreq_methods
### Title: Basic methods for the 'tsvreq' class
### Aliases: tsvreq_methods summary.tsvreq print.tsvreq plot.tsvreq
###   set_ts.tsvreq set_com.tsvreq set_comnull.tsvreq set_tsvr.tsvreq
###   set_wts.tsvreq get_ts.tsvreq get_com.tsvreq get_comnull.tsvreq
###   get_tsvr.tsvreq get_wts.tsvreq

### ** Examples

res<-tsvreq(ts=1:10,com=2*c(1:10),comnull=1:10,tsvr=rep(2,10),wts=rep(3,10))
get_ts(res)
print(res)
summary(res)
plot(res)
 



