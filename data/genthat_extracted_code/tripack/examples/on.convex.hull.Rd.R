library(tripack)


### Name: on.convex.hull
### Title: Determines if points are on the convex hull of a triangulation
###   object
### Aliases: on.convex.hull
### Keywords: spatial

### ** Examples

# example from TRIPACK:
data(tritest)
tr<-tri.mesh(tritest$x,tritest$y)
on.convex.hull(tr,0.5,0.5)
on.convex.hull(tr,c(0.5,-1,1),c(0.5,1,1))
# use a part of the quakes data set:
data(quakes)
quakes.part<-quakes[(quakes[,1]<=-10.78 & quakes[,1]>=-19.4 &
                     quakes[,2]<=182.29 & quakes[,2]>=165.77),]
q.tri<-tri.mesh(quakes.part$lon, quakes.part$lat, duplicate="remove")
on.convex.hull(q.tri,quakes.part$lon[1:20],quakes.part$lat[1:20])



