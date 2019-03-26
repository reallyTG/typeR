library(tsvr)


### Name: vreq_classic_ag_methods
### Title: Basic methods for the 'vreq_classic_ag' class
### Aliases: vreq_classic_ag_methods summary.vreq_classic_ag
###   print.vreq_classic_ag set_com.vreq_classic_ag
###   set_comnull.vreq_classic_ag set_vr.vreq_classic_ag
###   set_ts.vreq_classic_ag get_com.vreq_classic_ag
###   get_comnull.vreq_classic_ag get_vr.vreq_classic_ag
###   get_ts.vreq_classic_ag

### ** Examples

X<-matrix(runif(10*100),10,100)
h<-tsvreq_classic(X)
inp<-aggts(h,h$ts[h$ts>4])
print(inp)
summary(inp)
 



