library(DCluster)


### Name: tango.stat
### Title: Compute Tango's Statistic for General Clustering
### Aliases: tango.stat tango.test
### Keywords: spatial

### ** Examples

library(spdep)
data(nc.sids)

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
col.W.tango<-nb2listw(dlist, glist=lapply(dlist.d, function(x) {exp(-x)}),
        style="C")

#use exp(-D) as closeness matrix
tango.stat(sids, col.W.tango, zero.policy=TRUE)

tango.test(Observed~offset(log(Expected)), sids, model="poisson", R=99, 
   list=col.W.tango, zero.policy=TRUE)



