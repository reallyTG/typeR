library(acm4r)


### Name: clusters
### Title: Clustering
### Aliases: clusters

### ** Examples

## Don't show: 
(WD <- getwd())
if (!is.null(WD)) setwd(WD)
data(replicates.in)
write.table(replicates.in,  "replicates.in", quote=FALSE, row.names=FALSE)
data(experiments.in)
write.table(experiments.in, "experiments.in", quote=FALSE, row.names=FALSE)
call_erra("replicates.in",  dnum=1, sd=1, delete=TRUE)
res1<-call_acm("experiments.in")
res_bab<-call_bablbs(res1)
res_gd1<-call_gd1(res1)
## End(Don't show)
#synthesize the results
# Exact matching clusters
exact<-clusters(input=res1,type="exact")
names(exact)
exact$RTIN
exact$RTIN1
# Clustering based on BABLBS
bablbs<-clusters(input=res1, bablbs=res_bab,type="bablbs")
names(bablbs)
bablbs$RTIN
bablbs$RTIN1
# Clustering based on GD1
gd1<-clusters(input=res1, bablbs=res_gd1,type="gd1")
names(gd1)
gd1$RTIN
gd1$RTIN1



