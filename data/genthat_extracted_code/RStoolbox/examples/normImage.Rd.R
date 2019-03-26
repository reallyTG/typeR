library(RStoolbox)


### Name: normImage
### Title: Normalize Raster Images: Center and Scale
### Aliases: normImage

### ** Examples

library(raster)
## Load example data
data(rlogo)

## Normalization: Center and Scale
rlogo_center_norm <- normImage(rlogo)
hist(rlogo_center_norm)

## Centering
rlogo_center <- normImage(rlogo, norm = FALSE)



