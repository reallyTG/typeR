library(nandb)


### Name: number_timeseries
### Title: Create a number time-series.
### Aliases: number_timeseries

### ** Examples

img <- ijtiff::read_tif(system.file('extdata', '50.tif', package = "nandb"))
nts <- number_timeseries(img, "n", frames_per_set = 20, thresh = "Huang")



