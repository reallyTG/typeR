library(DCluster)


### Name: whittermore.stat
### Title: Compute Whittermore's Statistic
### Aliases: whittermore.stat whittermore.test
### Keywords: spatial

### ** Examples

library(spdep)
data(nc.sids)
col.W <- nb2listw(ncCR85.nb, zero.policy=TRUE)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74) )
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

#Calculate neighbours based on distance
coords<-as.matrix(sids[,c("x", "y")])

dlist<-dnearneigh(coords, 0, Inf)
dlist<-include.self(dlist)
dlist.d<-nbdists(dlist, coords)

#Calculate weights. They are globally standardised but it doesn't
#change significance.
col.W.whitt<-nb2listw(dlist, glist=dlist.d, style="C")


whittermore.stat(sids, col.W.whitt, zero.policy=TRUE)

whittermore.test(Observed~offset(log(Expected)), sids, model="poisson", R=99, 
   listw=col.W.whitt, zero.policy=TRUE)



