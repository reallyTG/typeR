library(mrfDepth)


### Name: outlyingness
### Title: Stahel-Donoho outlyingness of points relative to a dataset
### Aliases: outlyingness
### Keywords: multivariate

### ** Examples


# Compute the outlyingness of a simple two-dimensional dataset.
# Outliers are plotted in red.

if (requireNamespace("robustbase", quietly = TRUE)) {
    BivData <- log(robustbase::Animals2)
} else {
  BivData <- matrix(rnorm(120), ncol = 2)
  BivData <- rbind(BivData, matrix(c(6,6, 6, -2), ncol = 2))
}

Result <- outlyingness(x = BivData)
IndOutliers <- which(!Result$flagX)
plot(BivData)
points(BivData[IndOutliers,], col = "red")

# The number of directions may be specified through
# the option list. The resulting outlyingness is
# monotone increasing in the number of directions.
Result1 <- outlyingness(x = BivData,
                        options = list(ndir = 50)
                        )
Result2 <- outlyingness(x = BivData,
                        options = list(ndir = 100)
                        )
which(Result2$outlyingnessX - Result1$outlyingnessX < 0)
# This is however not the case when the seed is changed
Result1 <- outlyingness(x = BivData,
                        options = list(ndir = 50)
                        )
Result2 <- outlyingness(x = BivData,
                        options = list(ndir = 100,
                                       seed = 950)
                        )
plot(Result2$outlyingnessX - Result1$outlyingnessX,
     xlab = "Index", ylab = "Difference in outlyingness")

# We can also consider directions through two data
# points. If the sample is small enough one may opt
# to search over all choose(n,2) directions.
# Note that the computational load increases dramatically
# as n becomes larger.
Result <- outlyingness(x = BivData,
                       options = list(type = "Rotation",
                                      ndir = "all")
                       )
IndOutliers <- which(!Result$flagX)
plot(BivData)
points(BivData[IndOutliers,], col = "red")

# Alternatively one may consider randomly generated directions.
Result <- outlyingness(x = BivData,
                       options = list(type = "Shift",
                                      ndir = 1000)
                      )
IndOutliers <- which(!Result$flagX)
plot(BivData)
points(BivData[IndOutliers,], col = "red")

# The default option of using the MAD for the scale may be
# changed to using the univariate mcd.
Result <- outlyingness(x = BivData,
                       options = list(type = "Affine",
                                      ndir = 1000,
                                      stand = "MedMad",
                                      h = nrow(BivData))
                      )
IndOutliers <- which(!Result$flagX)
plot(BivData)
points(BivData[IndOutliers,], col = "red")




