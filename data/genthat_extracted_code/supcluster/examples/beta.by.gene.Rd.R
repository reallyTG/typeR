library(supcluster)


### Name: beta.by.gene
### Title: Utility to Associate the Value of beta with the Feature it is
###   Assocated With
### Aliases: beta.by.gene
### Keywords: supervised clustering

### ** Examples

dat=generate.cluster.data(1)
us=supcluster(dat,outcome="outcome",features=1:50,maxclusters=6,nstart=20,n=40)
vs=beta.by.gene(us)
colMeans(vs[,2:7])



