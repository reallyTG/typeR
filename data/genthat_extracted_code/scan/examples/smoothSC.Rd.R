library(scan)


### Name: smoothSC
### Title: Smoothing single-case data
### Aliases: smoothSC
### Keywords: manip

### ** Examples

## Use the three different smoothing functions and compare the results
berta_mmd <- smoothSC(Huber2014$Berta)
berta_mmn <- smoothSC(Huber2014$Berta, FUN = "movingMean")
berta_lre <- smoothSC(Huber2014$Berta, FUN = "localRegression")
plotSC(list("Original" = Huber2014$Berta,"Moving Median" = berta_mmd[[1]],
    "Moving Mean" = berta_mmn[[1]],"Local Regression" = berta_lre[[1]]))



