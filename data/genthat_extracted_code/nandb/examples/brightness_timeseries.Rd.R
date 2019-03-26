library(nandb)


### Name: brightness_timeseries
### Title: Create a brightness time-series.
### Aliases: brightness_timeseries

### ** Examples

img <- ijtiff::read_tif(system.file('extdata', '50.tif', package = 'nandb'))
bts <- brightness_timeseries(img, "e", frames_per_set = 20, thresh = "Huang")



