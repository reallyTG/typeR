library(VoxR)


### Name: axis.angle
### Title: Computing angle of points with an axis
### Aliases: axis.angle
### Keywords: 3d points cloud 3d angle

### ** Examples

data(treecloud_vox)

###################
#- using projection
#- computing angles

dist <- axis.angle(treecloud_vox,axis="X",projected=TRUE,plan="xy")
treecloud_vox[,4] <- dist

#- density plot

plot(density(dist,na.rm=TRUE))

#- visualisation

z <- c(sort(unique(round(treecloud_vox[,4],digits=0)),decreasing=TRUE))
col <- rainbow(n=length(z),start=0,end=2/6)
library(rgl)
open3d()
for(i in 1:length(z)){
  a <- subset(treecloud_vox,round(treecloud_vox[,4],digits=0)==z[i])
  plot3d(a,col=col[i],add=TRUE)}

#####################
#- without projection
#- computing angles

dist <- axis.angle(treecloud_vox,axis="X",projected=FALSE)
treecloud_vox[,4] <- dist

#- density plot

plot(density(dist,na.rm=TRUE))

#- visualisation

z <- c(sort(unique(round(treecloud_vox[,4],digits=0)),decreasing=TRUE))
col <- rainbow(n=length(z),start=0,end=2/6)
open3d()
for(i in 1:length(z)){
  a <- subset(treecloud_vox,round(treecloud_vox[,4],digits=0)==z[i])
  plot3d(a,col=col[i],add=TRUE)
}



