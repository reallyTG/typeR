library(tsvr)


### Name: tsvreq_classic_methods
### Title: Basic methods for the 'tsvreq_classic' class
### Aliases: tsvreq_classic_methods summary.tsvreq_classic
###   print.tsvreq_classic plot.tsvreq_classic set_ts.tsvreq_classic
###   set_com.tsvreq_classic set_comnull.tsvreq_classic
###   set_tsvr.tsvreq_classic set_wts.tsvreq_classic get_ts.tsvreq_classic
###   get_com.tsvreq_classic get_comnull.tsvreq_classic
###   get_tsvr.tsvreq_classic get_wts.tsvreq_classic

### ** Examples

X<-matrix(runif(10*100),10,100)
res<-tsvreq_classic(X)
get_ts(res)
print(res)
summary(res)
 



