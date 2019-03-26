library(DistatisR)


### Name: distatis
### Title: 'distatis' 3-Way MDS based on the STATIS optimization procedure
### Aliases: distatis DiSTATIS CovSTATIS covstatis
### Keywords: distatis mds

### ** Examples

# 1. Load the DistAlgo data set (available from the DistatisR package)
data(DistAlgo)
# DistAlgo is a 6*6*4 Array (face*face*Algorithm)
#-----------------------------------------------------------------------------
# 2. Call the DISTATIS routine with the array of distance (DistAlgo) as parameter
DistatisAlgo <- distatis(DistAlgo)


