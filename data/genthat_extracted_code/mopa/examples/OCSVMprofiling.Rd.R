library(mopa)


### Name: OCSVMprofiling
### Title: Environmental profiling with One-Classification Support Vector
###   Machine
### Aliases: OCSVMprofiling

### ** Examples

## Load presence data
data(Oak_phylo2)

## Load climate data
destfile <- tempfile()
data.url <- "https://raw.githubusercontent.com/SantanderMetGroup/mopa/master/data/biostack.rda"
download.file(data.url, destfile)
load(destfile, verbose = TRUE)

## Spatial reference
projection(biostack$baseline) <- CRS("+proj=longlat +init=epsg:4326")
r <- biostack$baseline[[1]]
## Background of the whole study area
bg <- backgroundGrid(r)

## Environmental profiling
bg.profiled <- OCSVMprofiling(xy = Oak_phylo2, varstack = biostack$baseline, 
                              background = bg$xy)
## Plot
plot(bg.profiled$absence$H11, pch="*")
points(bg.profiled$presence$H11, pch="*", col= "pink")




