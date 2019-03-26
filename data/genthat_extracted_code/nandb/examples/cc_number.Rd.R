library(nandb)


### Name: cc_number
### Title: Cross-correlated number.
### Aliases: cc_number

### ** Examples

img <- ijtiff::read_tif(system.file("extdata", "two_ch.tif",
                                    package = "nandb"))
ijtiff::display(detrendr::mean_pillars(img[, , 1, ]))
ijtiff::display(detrendr::mean_pillars(img[, , 2, ]))
n <- number(img, def = "n", thresh = "Huang", filt = "median")
ijtiff::display(n[, , 1, 1])
ijtiff::display(n[, , 2, 1])
cc_n <- cc_number(img, thresh = "Huang")
ijtiff::display(cc_n[, , 1, 1])



