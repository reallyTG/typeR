library(DRIP)


### Name: JPLLK_surface
### Title: Denoising and jump-preserving
### Aliases: JPLLK_surface
### Keywords: Surface estimation

### ** Examples

data(sar) # SAR image is bundled with the package and it is a 
          # standard test image in statistics literature.
fit = JPLLK_surface(image=sar, bandwidth=c(3, 4))



