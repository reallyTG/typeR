library(TOC)


### Name: ROC
### Title: Construct the table for the ROC curve
### Aliases: ROC ROC,numeric,numeric-method
###   ROC,RasterLayer,RasterLayer-method
### Keywords: methods spatial

### ** Examples

index <- raster(system.file("external/Prob_Map2.rst", package = "TOC"))
boolean <- raster(system.file("external/Change_Map2b.rst", package = "TOC"))
mask <- raster(system.file("external/MASK4.rst", package = "TOC"))

## thresholds can be defined by indicating the number of equal-interval thresholds 
rocd <- ROC(index, boolean, mask, nthres = 100)
rocd

## a vector of thresholds can also be used to define the thresholds
thresholds <- seq(min(unique(index)), max(unique(index)) + 1, 
                  by = ceiling(max(unique(index))/10))
rocd <- ROC(index, boolean, mask, thres = thresholds)
rocd

## all the unique values of the index object can be evaluated as thresholds (default option)
## Not run: 
##D rocd <- ROC(index, boolean, mask, progress = TRUE)
##D rocd
## End(Not run)

## generate the ROC curve using non-spatial data (i.e., an object of class numeric)
## Not run: 
##D index <- getValues(index)
##D boolean <- getValues(boolean)
##D mask <- getValues(mask)
##D rocd <- ROC(index, boolean, mask, nthres = 100)
## End(Not run)



