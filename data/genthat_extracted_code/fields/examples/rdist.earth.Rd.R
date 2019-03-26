library(fields)


### Name: rdist.earth
### Title: Great circle distance matrix or vector
### Aliases: rdist.earth rdist.earth.vec
### Keywords: spatial

### ** Examples

data(ozone2)
out<- rdist.earth ( ozone2$lon.lat)
#out is a 153X153 distance matrix
upper<-  col(out)> row( out)
# histogram of all pairwise distances. 
hist( out[upper])

#get pairwise distances between first 10 and second 10 lon/lat points
x1 = ozone2$lon.lat[1:10,]
x2 = ozone2$lon.lat[11:20,]
dists = rdist.earth.vec(x1, x2)
print(dists)



