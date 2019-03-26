library(DRIP)


### Name: diffLC2K
### Title: local constant kernel difference
### Aliases: diffLC2K
### Keywords: one-sided estimator, jump-preserving

### ** Examples

data(sar) # SAR image is bundled with the package and it is a 
          # standard test image in statistics literature.
diff = diffLC2K(image = sar, bandwidth = 4)



