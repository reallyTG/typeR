library(rasterList)


### Name: RasterListApply
### Title: A function for operations among 'RasterList-class' objects.
### Aliases: RasterListApply

### ** Examples




f <- system.file("external/test.grd", package="raster")

ra <- rasterList(f)
rb <- rasterList(f)

rm <- RasterListApply(x=ra,y=rb,z=10,FUN=function(x,y,z){x+y+z})

### Fitting a probability distribution for precipitation 
### in each cell with "lmon" package (L Moments) 
library(lmom)


# The package-provided datasets shall be only used as example datasets. 
precf <- system.file("map/Mekrou_precipitation.grd", package="rasterList") ## 
## A resampled preciptation raster map based on CHIRS dataset:
## Funk, Chris, Pete Peterson, Martin Landsfeld, Diego Pedreros, James Verdin, 
## Shraddhanand Shukla, Gregory Husak, James Rowland, Laura Harrison, 
## Andrew Hoell and Joel Michaelsen.
## "The climate hazards infrared precipitation with stations -a new environmental 
## record for monitoring extremes". Scientific Data 2, 150066. doi:10.1038/sdata.2015.66 2015. 
## http://chg.geog.ucsb.edu/data/chirps/
##
prec <- stack(precf)
## Sample L-moments 
samlmom <- stack(rasterList(prec,FUN=samlmu))
## Fitting a Random Probability Distribution: it is a 'rasterList' Object
fitdist <- rasterList(samlmom,FUN=pelgam)

## KS TESTING

kstesting <- RasterListApply(x=rasterList(prec),y="cdfgam",para=fitdist,FUN=ks.test)

## Mapping of p-value 
pval_ks <- raster(kstesting,FUN=function(x){x$p.value})



