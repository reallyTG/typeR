library(autothresholdr)


### Name: med_stack_thresh
### Title: Threshold every image frame in a stack based on their median.
### Aliases: med_stack_thresh

### ** Examples

img <- ijtiff::read_tif(system.file('extdata', '50.tif',
                                    package = 'autothresholdr'))
ijtiff::display(img[, , 1, 1])
img_thresh_mask <- med_stack_thresh(img, 'Otsu')
ijtiff::display(img_thresh_mask[, , 1, 1])
ijtiff::display(img[, , 1, 1])
img_thresh_mask <- med_stack_thresh(img, 'Triangle')
ijtiff::display(img_thresh_mask[, , 1, 1])




