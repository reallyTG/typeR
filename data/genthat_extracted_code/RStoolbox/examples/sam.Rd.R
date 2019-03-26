library(RStoolbox)


### Name: sam
### Title: Spectral Angle Mapper
### Aliases: sam

### ** Examples

library(raster)
library(ggplot2)
## Load example data-set
data(lsat) 

## Sample endmember spectra 
## First location is water, second is open agricultural vegetation
pts <- data.frame(x = c(624720, 627480), y = c(-414690, -411090))
endmembers <- extract(lsat, pts)
rownames(endmembers) <- c("water", "vegetation")

## Calculate spectral angles
lsat_sam <- sam(lsat, endmembers, angles = TRUE)
plot(lsat_sam)

## Classify based on minimum angle
lsat_sam <- sam(lsat, endmembers, angles = FALSE)

## No test: 
ggR(lsat_sam, forceCat = TRUE, geom_raster=TRUE) + 
        scale_fill_manual(values = c("blue", "green"), labels = c("water", "vegetation"))
## End(No test)



