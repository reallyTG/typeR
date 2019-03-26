library(rLiDAR)


### Name: chullLiDAR3D
### Title: 3D convex hull of the individual tree LiDAR-derived point cloud
### Aliases: chullLiDAR3D

### ** Examples


# Importing LAS file:
LASfile <- system.file("extdata", "LASexample1.las", package="rLiDAR")

# Reading LAS file
LAS<-readLAS(LASfile,short=TRUE)

# Setring the xyz coordinates and subsetting the data
xyz<-subset(LAS[,1:3],LAS[,3] >= 1.37)

# Finding clusters
clLAS<-kmeans(xyz, 32)

# Set the id vector
id<-as.factor(clLAS$cluster)

#=================================================#
# Example 01
#=================================================#
# Set the alpha
alpha<-0.6

# Set the plotCAS parameter
plotit=TRUE

# Set the convex hull color
col="forestgreen"

# Combining xyz and id
xyzid<-cbind(xyz,id)

# Get the volume and surface area
library(rgl)
open3d() 
volumeList<-chullLiDAR3D(xyzid=xyzid, plotit=plotit, col=col,alpha=alpha)
summary(volumeList) # summary

plot3d(xyzid[,1:3], add=TRUE)   # add the 3D point cloud
axes3d(c("x+", "y-", "z-"))                 # axes
grid3d(side=c('x+', 'y-', 'z'), col="gray") # grid
title3d(xlab = "UTM Easthing", ylab = "UTM Northing",zlab = "Height", col="red")
aspect3d(1,1,0.7) # scale

#=================================================#
# Example 02
#=================================================#
# Set the alpha
alpha<-0.85

# Set the plotCAS parameter
plotit=TRUE

# Set the convex hull color
col=levels(factor(id))

# Combining xyz and id
xyzid<-cbind(xyz,id)

# Get the volume and surface area
open3d() 
volumeList<-chullLiDAR3D(xyzid=xyzid, plotit=plotit, col=col,alpha=alpha)
summary(volumeList)

# Add other plot parameters
plot3d(xyzid[,1:3], col=xyzid[,4], add=TRUE)   # add the 3D point cloud
axes3d(c("x+", "y-", "z-"))                 # axes
grid3d(side=c('x+', 'y-', 'z'), col="gray") # grid
title3d(xlab = "UTM Easthing", ylab = "UTM Northing",zlab = "Height", col="red")
aspect3d(1,1,0.7) # scale




