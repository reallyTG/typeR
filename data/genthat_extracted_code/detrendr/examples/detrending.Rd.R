library(detrendr)


### Name: detrending
### Title: Detrend images.
### Aliases: detrending img_detrend_robinhood img_detrend_rh
###   img_detrend_boxcar img_detrend_exp img_detrend_polynom

### ** Examples

## Not run: 
##D ## These examples are not run on CRAN because they take too long.
##D ## You can still try them for yourself.
##D 
##D img <- ijtiff::read_tif(system.file('extdata', 'bleached.tif',
##D                                     package = 'detrendr'))
##D corrected <- img_detrend_rh(img)
##D corrected <- img_detrend_boxcar(img, "auto", purpose = "fcs", parallel = 2)
##D corrected10 <- img_detrend_boxcar(img, 10, purpose = "fcs", parallel = 2)
##D corrected50 <- img_detrend_boxcar(img, 50, purpose = "fcs", parallel = 2)
##D corrected <- img_detrend_exp(img, "auto", purpose = "ffs", parallel = 2)
##D corrected10 <- img_detrend_exp(img, 10, purpose = "ffs", parallel = 2)
##D corrected50 <- img_detrend_exp(img, 50, purpose = "fcs", parallel = 2)
##D corrected <- img_detrend_polynom(img, "auto", purpose = "ffs", parallel = 2)
##D corrected2 <- img_detrend_polynom(img, 2, purpose = "ffs", parallel = 2)
## End(Not run)



