library(RmarineHeatWaves)


### Name: exceedance
### Title: Detect consecutive days in exceedance of a given threshold.
### Aliases: exceedance

### ** Examples

ts_dat <- make_whole(sst_WA)
res <- exceedance(ts_dat, threshold = 25)
# show first ten days of daily data:
res$threshold[1:10, ]
# show first five exceedances:
res$exceedance[1:5, ]



