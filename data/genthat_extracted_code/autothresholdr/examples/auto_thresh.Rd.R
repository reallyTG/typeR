library(autothresholdr)


### Name: auto_thresh
### Title: Automatically threshold an array of non-negative integers.
### Aliases: auto_thresh auto_thresh_mask auto_thresh_apply_mask mask
###   apply_mask

### ** Examples

img_location <- system.file("extdata", "eg.tif", package = "autothresholdr")
img <- ijtiff::read_tif(img_location)
auto_thresh(img, "huang")
auto_thresh(img, "tri")
auto_thresh(img, "Otsu")
auto_thresh(img, 9)
mask <- auto_thresh_mask(img, "huang")
ijtiff::display(mask[, , 1, 1])
masked <- auto_thresh_apply_mask(img, "huang")
ijtiff::display(masked[, , 1, 1])
masked <- auto_thresh_apply_mask(img, 25)
ijtiff::display(masked[, , 1, 1])



