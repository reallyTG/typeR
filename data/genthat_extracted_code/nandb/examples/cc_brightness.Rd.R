library(nandb)


### Name: cc_brightness
### Title: Cross-correlated brightness.
### Aliases: cc_brightness

### ** Examples

img <- ijtiff::read_tif(system.file("extdata", "two_ch.tif",
                                    package = "nandb"))
ijtiff::display(detrendr::mean_pillars(img[, , 1, ]))
ijtiff::display(detrendr::mean_pillars(img[, , 2, ]))
b <- brightness(img, def = "e", thresh = "Huang", filt = "median")
ijtiff::display(b[, , 1, 1])
ijtiff::display(b[, , 2, 1])
cc_b <- cc_brightness(img, thresh = "Huang")
ijtiff::display(cc_b[, , 1, 1])



