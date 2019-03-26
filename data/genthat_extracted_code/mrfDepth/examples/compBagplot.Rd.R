library(mrfDepth)


### Name: compBagplot
### Title: Location estimate based on the halfspace depth
### Aliases: compBagplot
### Keywords: multivariate

### ** Examples

data(bloodfat)
Result <- compBagplot(bloodfat)
bagplot(Result)

# The sizesubset argument may be used to control the
# computation time when computing the bagplot based on
# halfspace depth. However results may be unreliable when
# choosing a small subset for the main computations.
system.time(Result1 <- compBagplot(bloodfat))
system.time(Result2 <- compBagplot(bloodfat, sizesubset = 100))
bagplot(Result1)
bagplot(Result2)

# When using the projection depth or skewness-adjusted
# projection depth to compute the bagplot a list of options
# may be passed down to the (adj)outlyingness routines.
options <- list(type = "Rotation",
                ndir = 50,
                stand = "unimcd",
                h = floor(nrow(bloodfat)*3/4))
Result <- compBagplot(bloodfat,
                      type = "projdepth", options = options)
bagplot(Result)

# The fence is computed using the depthContour function.
# To get a smoother fence, one may opt to consider extra
# directions.
options <- list(ndir = 500,
                seed = 36)
Result <- compBagplot(bloodfat,
                      type = "sprojdepth", options = options)
bagplot(Result, plot.fence = TRUE)

options <- list(ndir = 500,
                seed = 36)
Result <- compBagplot(bloodfat,
                      type = "sprojdepth", options = options,
                      extra.directions = TRUE)
bagplot(Result, plot.fence = TRUE)



