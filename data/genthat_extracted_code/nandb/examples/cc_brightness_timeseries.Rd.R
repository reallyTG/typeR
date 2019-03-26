library(nandb)


### Name: cc_brightness_timeseries
### Title: Create a cross-correlated brightness time-series.
### Aliases: cc_brightness_timeseries

### ** Examples

img <- ijtiff::read_tif(system.file('extdata', 'two_ch.tif',
                        package = 'nandb'))
cc_bts <- cc_brightness_timeseries(img, 10, thresh = "Huang",
                                    filt = 'median', parallel = 2)
ijtiff::display(cc_bts[, , 1, 1])



