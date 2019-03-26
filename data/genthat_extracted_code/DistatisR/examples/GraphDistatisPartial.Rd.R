library(DistatisR)


### Name: GraphDistatisPartial
### Title: Plot maps of the factor scores and partial factor scores of the
###   observations for a DISTATIS analysis.
### Aliases: GraphDistatisPartial
### Keywords: DistatisR mds

### ** Examples

# 1. Load the DistAlgo data set (available from the DistatisR package)
data(DistAlgo)
# DistAlgo is a 6*6*4 Array (face*face*Algorithm)
#-----------------------------------------------------------------------------
# 2. Call the DISTATIS routine with the array of distance (DistAlgo) as parameter
DistatisAlgo <- distatis(DistAlgo)
# 3. Plot the compromise map with the labels for the first 2 dimensions
# DistatisAlgo$res4Splus$F are the factors scores for the 6 observations (i.e., faces)
# DistatisAlgo$res4Splus$PartialF are the partial factors scores 
	##(i.e., one set of factor scores per algorithm)
 GraphDistatisPartial(DistatisAlgo$res4Splus$F,DistatisAlgo$res4Splus$PartialF)



