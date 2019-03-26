library(VoxR)


### Name: axis.distance
### Title: Computing distance of points from an axis
### Aliases: axis.distance
### Keywords: 3d points cloud 3d distance

### ** Examples

data(treecloud_vox)

#- computing distances

dist <- axis.distance(treecloud_vox,axis="Z")
treecloud_vox[,4] <- dist

#-density plot

plot(density(dist,na.rm=TRUE))

#-visualisation

z <- c(sort(unique(round(treecloud_vox[,4],digits=2)),decreasing=TRUE))
col <- rainbow(n=length(z),start=0,end=2/6)
require(rgl)
library(rgl)
open3d()
for(i in 1:length(z)){
  a <- subset(treecloud_vox,round(treecloud_vox[,4],digits=2)==z[i])
  plot3d(a,col=col[i],add=TRUE)}



