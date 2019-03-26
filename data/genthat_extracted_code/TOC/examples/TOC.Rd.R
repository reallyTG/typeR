library(TOC)


### Name: TOC
### Title: Construct the table for the TOC curve
### Aliases: TOC TOC,numeric,numeric-method
###   TOC,RasterLayer,RasterLayer-method
### Keywords: methods spatial

### ** Examples

index <- raster(system.file("external/Prob_Map2.rst", package = "TOC"))
boolean <- raster(system.file("external/Change_Map2b.rst", package = "TOC"))
mask <- raster(system.file("external/MASK4.rst", package = "TOC"))

## thresholds can be defined by indicating the number of equal-interval thresholds 
tocd <- TOC(index, boolean, mask, nthres = 100)
tocd

## a vector of thresholds can also be used to define the thresholds
thresholds <- seq(min(unique(index)), max(unique(index)) + 1, 
                  by = ceiling(max(unique(index))/10))
tocd <- TOC(index, boolean, mask, thres = thresholds)
tocd

## all the unique values of the index object can be evaluated as thresholds (default option)
## Not run: 
##D tocd <- TOC(index, boolean, mask, progress = TRUE)
##D tocd
## End(Not run)

## generate the TOC curve using non-spatial data (i.e., an object of class numeric)
## Not run: 
##D index <- getValues(index)
##D boolean <- getValues(boolean)
##D mask <- getValues(mask)
##D tocd <- TOC(index, boolean, mask, nthres = 100)
## End(Not run)



