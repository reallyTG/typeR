library(detrendr)


### Name: detrend-directory
### Title: Detrend all TIFF images in an entire folder.
### Aliases: detrend-directory dir_detrend_robinhood dir_detrend_rh
###   dir_detrend_boxcar dir_detrend_exp dir_detrend_polynom

### ** Examples

## Not run: 
##D setwd(tempdir())
##D file.copy(c(system.file("extdata", "bleached.tif", package = "detrendr"),
##D             system.file("img", "2ch_ij.tif", package = "ijtiff")),
##D           ".")
##D dir_detrend_robinhood(thresh = "huang")
##D dir_detrend_boxcar(l = "auto", thresh = "tri", purpose = "FFS")
##D dir_detrend_exp(tau = "auto", thresh = "tri", purpose = "FCS")
##D dir_detrend_polynom(degree = "auto", thresh = "huang", purpose = "FFS")
## End(Not run)



