library(rLiDAR)


### Name: readLAS
### Title: Reading LiDAR data
### Aliases: readLAS

### ** Examples


#=======================================================================#
# Importing LAS file:
#=======================================================================#
LASfile <- system.file("extdata", "LASexample1.las", package="rLiDAR")

# Reading LAS file
rLAS<-readLAS(LASfile,short=TRUE)

# Summary of the LAS file
summary(rLAS)

#=======================================================================#
# LAS file visualization:
#=======================================================================#

# 01 Set a single color 

col<-"forestgreen"

# plot 2D
plot(rLAS[,1],rLAS[,2], col=col,xlab="UTM.Easting", ylab="UTM.Northing", main="Single color")

# plot 3D
library(rgl)
points3d(rLAS[,1:3], col=col, axes=FALSE,xlab="", ylab="", zlab="")
axes3d(c("x+", "y-", "z-"))                 # axes
grid3d(side=c('x+', 'y-', 'z'), col="gray") # grid
title3d(xlab = "UTM.Easting", ylab = "UTM.Northing",zlab = "Height(m)", col="red") # title
planes3d(0, 0, -1, 0.001, col="gray", alpha=0.7)   # terrain


# 02 Set a color by height 

# color ramp
myColorRamp <- function(colors, values) {
v <- (values - min(values))/diff(range(values))
x <- colorRamp(colors)(v)
rgb(x[,1], x[,2], x[,3], maxColorValue = 255)
}

# Color by height
col <- myColorRamp(c("blue","green","yellow","red"),rLAS[,3])

# plot 2D
plot(rLAS[,1], rLAS[,2], col=col, xlab="UTM.Easting", ylab="UTM.Northing", main="Color by height")

# plot 3D
points3d(rLAS[,1:3], col=col, axes=FALSE, xlab="", ylab="", zlab="")
axes3d(c("x+", "y-", "z-"))                     # axes
grid3d(side=c('x+', 'y-', 'z'), col="gray")     # grid
title3d(xlab = "UTM.Easting", ylab = "UTM.Northing",zlab = "Height(m)", col="red") # title
planes3d(0, 0, -1, 0.001, col="gray",alpha=0.7) # terrain




