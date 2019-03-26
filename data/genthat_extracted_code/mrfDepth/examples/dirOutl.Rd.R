library(mrfDepth)


### Name: dirOutl
### Title: Directional outlyingness of points relative to a dataset
### Aliases: dirOutl
### Keywords: multivariate

### ** Examples

# Compute the directional outlyingness of a simple
# two-dimensional dataset. Outliers are plotted
# in red.
data("geological")
BivData <- geological[c("MnO","MgO")]
Result <- dirOutl(x = BivData)
IndOutliers <- which(!Result$flagX)
plot(BivData)
points(BivData[IndOutliers,], col = "red")

# The number of directions may be specified through
# the option list. The resulting adjusted outlyingness
# is monotone increasing in the number of directions.
Result1 <- dirOutl(x = BivData,options = list(ndir = 50))
Result2 <- dirOutl(x = BivData,options = list(ndir = 100))
which(Result2$outlyingnessX - Result1$outlyingnessX < 0)
# This is however not the case when the seed is changed
Result1 <- dirOutl(x = BivData,options = list(ndir = 50))
Result2 <- dirOutl(x = BivData,options = list(ndir = 100,seed = 950))

plot(Result2$outlyingnessX - Result1$outlyingnessX,
     xlab = "Index", ylab = "Difference in DO")

# Consider another example:

data("bloodfat")
BivData <- bloodfat[1:100,] # Consider a small toy example.
Result <- dirOutl(x = BivData,options = list(type = "Affine"))
IndOutliers <- which(!Result$flagX)
plot(BivData)
points(BivData[IndOutliers,], col = "red")




