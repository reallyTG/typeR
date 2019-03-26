library(nandb)


### Name: cc_number_timeseries
### Title: Create a cross-correlated number time-series.
### Aliases: cc_number_timeseries

### ** Examples

img <- ijtiff::read_tif(system.file('extdata', 'two_ch.tif',
                                    package = 'nandb'))
cc_nts <- cc_number_timeseries(img, 10, thresh = "Huang",
                               filt = 'median', parallel = 2)
ijtiff::display(cc_nts[, , 1, 1])




