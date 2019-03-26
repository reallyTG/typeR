library(rLiDAR)


### Name: CrownMetrics
### Title: LiDAR-derived individual tree crown metrics
### Aliases: CrownMetrics

### ** Examples


#=======================================================================#
# Individual tree detection using K-means cluster
#=======================================================================#
# Importing LAS file:
LASfile <- system.file("extdata", "LASexample1.las", package="rLiDAR")

# Reading LAS file
LAS<-readLAS(LASfile,short=TRUE)

# Setting the xyz coordinates and subsetting the data
xyzi<-subset(LAS[,1:4],LAS[,3] >= 1.37)

# Finding clusters (trees)
clLAS<-kmeans(xyzi[,1:2], 32)

# Set the tree id vector
Id<-as.factor(clLAS$cluster)

# Combining xyzi and tree id 
xyziId<-cbind(xyzi,Id)

#=======================================================================#
#  Computing individual tree LiDAR metrics 
#=======================================================================#

TreesMetrics<-CrownMetrics(xyziId)
head(TreesMetrics)



