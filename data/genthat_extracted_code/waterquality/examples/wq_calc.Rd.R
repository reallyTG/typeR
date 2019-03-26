library(waterquality)


### Name: wq_calc
### Title: Water quality calculation
### Aliases: wq_calc

### ** Examples

library(raster)

# sentinel2 example
s2 = stack(system.file("raster/S2_Harsha.tif", package = "waterquality"))
s2_Al10SABI = wq_calc(s2, alg = "Al10SABI", sat = "sentinel2")
s2_two_alg = wq_calc(s2, alg = c("TurbChip09NIROverGreen", "Am092Bsub"), sat = "sentinel2")

## Not run: 
##D (
##D s2_wq = wq_calc(s2, alg = "all", sat = "sentinel2")
##D 
##D # landsat8 example
##D l8 = stack(system.file("raster/L8_Taylorsville.tif", package = "waterquality"))
##D l8_wq = wq_calc(s2, alg = "all", sat = "landsat8")
##D )
## End(Not run)



