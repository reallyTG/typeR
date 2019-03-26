library(MDSMap)


### Name: convert.polar
### Title: Convert Cartesian coordinates from wMDS coordinates to polar
###   coordinates.
### Aliases: convert.polar

### ** Examples

#M and lod should be n x n symmetric matrices of the same dimensions where n 
#is the number markers to be analysed
## Not run: 
##D mds1<-smacofSphere(M,ndim=2,algorithm="dual",weightmat=lod,penalty=100)
##D pol<-convert.polar(mds1,n)
## End(Not run)



