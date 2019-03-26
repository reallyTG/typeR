library(mrfDepth)


### Name: adjOutl
### Title: Adjusted outlyingness of points relative to a dataset
### Aliases: adjOutl
### Keywords: multivariate

### ** Examples

# Compute the adjusted outlyingness of a simple
# two-dimensional dataset. Outliers are plotted
# in red.
data("geological")
BivData <- geological[c("MnO","MgO")]
Result <- adjOutl(x = BivData)
IndOutliers <- which(!Result$flagX)
plot(BivData)
points(BivData[IndOutliers,], col = "red")

# The number of directions may be specified through
# the option list. The resulting adjusted outlyingness
# is monotone increasing in the number of directions.
Result1 <- adjOutl(x = BivData,
                   options = list(ndir = 50)
                   )
Result2 <- adjOutl(x = BivData,
                   options = list(ndir = 100)
                   )
which(Result2$outlyingnessX - Result1$outlyingnessX < 0)
# This is however not the case when the seed is changed
Result1 <- adjOutl(x = BivData,
                   options = list(ndir = 50)
                   )
Result2 <- adjOutl(x = BivData,
                   options = list(ndir = 100,
                                  seed = 950)
                   )
plot(Result2$outlyingnessX - Result1$outlyingnessX,
     xlab = "Index", ylab = "Difference in AO")

# We can also consider directions through two data
# points. If the sample is small enough one may opt
# to search over all choose(n,2) directions.
# Note that the computational load increases dramatically
# as n becomes larger.
data("bloodfat")
BivData <- bloodfat[1:100,] # Consider a small toy example.
Result <- adjOutl(x = BivData,
                  options = list(type = "Rotation",
                                 ndir = "all")
                  )
IndOutliers <- which(!Result$flagX)
plot(BivData)
points(BivData[IndOutliers,], col = "red")

# Alternatively one may consider randomly generated directions.
data("bloodfat")
Result = adjOutl(x = bloodfat,
                 options = list(type = "Shift",
                                ndir = 1000)
                 )
IndOutliers <- which(!Result$flagX)
plot(bloodfat)
points(bloodfat[IndOutliers,], col = "red")



