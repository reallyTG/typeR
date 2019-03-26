library(rLiDAR)


### Name: LASmetrics
### Title: LiDAR-derived metrics
### Aliases: LASmetrics

### ** Examples


#=======================================================================#
# Example 01: Computing LiDAR metrics for a single LAS file
#=======================================================================#
# Import the LAS data file
LASfile <- system.file("extdata", "LASexample1.las", package="rLiDAR")

# Set the minht and above parameters
minht<-1.37  # meters or feet
above<-2.00  # meters or feet

# LiDAR metrics computation
LiDARmetrics<-LASmetrics(LASfile, minht, above)

#==========================================================================#
# Example 02: Computing Lidar metrics for multiple LAS files within a folder
#==========================================================================#
# Set folder where LAS source files reside
folder=dirname(LASfile)

# Get list of LAS files residing in the folder
LASlist <- list.files(folder, pattern="*.las", full.names=TRUE)

# Set the "minht" and "above" parameters
minht<-1.37  # meters or feet
above<-2.00  # meters or feet

# Creat an empty dataframe in whic to store the LiDAR metrics
getMetrics<-data.frame()

# Set a loop to compute the LiDAR metrics
for ( i in LASlist) {
 getMetrics<-rbind(getMetrics, LASmetrics(i, minht, above))}

# Table of the Lidar metrics
LiDARmetrics<-cbind(Files=c(basename(LASlist)), getMetrics)
head(LiDARmetrics)




