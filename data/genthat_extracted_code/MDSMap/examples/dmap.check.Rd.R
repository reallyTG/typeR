library(MDSMap)


### Name: dmap.check
### Title: Reorders a distance map by a new marker order.
### Aliases: dmap.check

### ** Examples

s<-matrix(1:25,nrow=5)
s<-0.5*(s+t(s))
rank<-c(1,3,4,2,5)
dmap.check(s,rank)



