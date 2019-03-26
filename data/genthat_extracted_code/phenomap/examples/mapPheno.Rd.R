library(phenomap)


### Name: mapPheno
### Title: Convert a series of raster files to a single phenology raster.
### Aliases: mapPheno

### ** Examples

## Don't show: 
fpath <- system.file("extdata", package="phenomap")
File_List <- paste(fpath, list.files(path = fpath, pattern=c("ExCrop_")), sep="/")
File_List <- File_List[1:2]

PhenoFactor = "VI"
phase = "greenup"
threshold = 0.5
year = 2016
NDVI = 1
VIQ = 3
DOY = 4
PR = 5
parallel = FALSE
n.cores = NA
verbose = FALSE

## End(Don't show)
## Not run: 
##D 
##D Sample.Greenup <- mapPheno(File_List = File_List, PhenoFactor = PhenoFactor,
##D                            phase = phase, threshold = threshold, year = year,
##D                            NDVI = NDVI, VIQ = VIQ, DOY = DOY, PR = PR,
##D                            SnowExtent = SnowExtent,
##D                            parallel = parallel, n.cores = n.cores,
##D                            verbose = verbose)
##D 
## End(Not run)



