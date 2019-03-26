library(DistatisR)


### Name: GraphDistatisRv
### Title: Plot maps of the factor scores (from the Rv matrix) of the
###   distance matrices for a DISTATIS analysis
### Aliases: GraphDistatisRv
### Keywords: DistatisR

### ** Examples

# 1. Load the DistAlgo data set (available from the DistatisR package)
data(DistAlgo)
# DistAlgo is a 6*6*4 Array (faces*faces*Algorithms)
#-----------------------------------------------------------------------------
# 2. Call the DISTATIS routine with the array of distance (DistAlgo) as parameter
DistatisAlgo <- distatis(DistAlgo)
# 3. Plot the compromise map with the labels for the first 2 dimensions
# DistatisAlgo$res4Cmat$G are the factors scores 
#  for the 4 distance matrices (i.e., algorithms)
 GraphDistatisRv(DistatisAlgo$res4Cmat$G,ZeTitle='Rv Mat')
# Et voila!



