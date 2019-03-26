library(binhf)


### Name: statgen
### Title: Statistics generator
### Aliases: statgen
### Keywords: manip

### ** Examples

a<-afgen(xgrid = seq(0, 1, length = 21), ygrid = seq(0, 1, length = 21), 
samples = 1000, binsize = 32)

b<-statgen(a,xgrid=seq(0,1,length=21),ygrid=seq(0,1,length=21),binsize=32,plot.m=FALSE,
plot.v=TRUE,plot.ks=FALSE,ptype="persp")




