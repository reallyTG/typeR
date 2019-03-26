library(MDSMap)


### Name: map.to.interval
### Title: Map points from MDS final configuration to interval starting at
###   0.
### Aliases: map.to.interval

### ** Examples

# M and lod should be n x n symmetric matrices of the same dimensions where
# n is the number markers to be analysed
## Not run: 
##D mds1<-smacofSphere(M,ndim=2,algorithm=dual,weightmat=lod,penalty=100)
##D pol<-map.to.interval (m1,n)
## End(Not run)



