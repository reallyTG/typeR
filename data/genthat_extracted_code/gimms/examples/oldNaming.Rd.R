library(gimms)


### Name: oldNaming
### Title: Create Traditional GIMMS NDVI3g File Names
### Aliases: oldNaming

### ** Examples

fls <- system.file("extdata", "inventory_ecv1.rds", package = "gimms")
fls <- basename(readRDS(fls))

oldNaming(fls[64:65], suffix = ".tif") # adds .tif extension
oldNaming(fls[65:66])                  # tags newer files with 'XX'




