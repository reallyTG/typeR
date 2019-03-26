library(RStoolbox)


### Name: tasseledCap
### Title: Tasseled Cap Transformation
### Aliases: tasseledCap

### ** Examples

library(raster)
data(lsat)

## Run tasseled cap (exclude thermal band 6)
lsat_tc <- tasseledCap(lsat[[c(1:5,7)]], sat = "Landsat5TM")
lsat_tc
plot(lsat_tc)



