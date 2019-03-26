library(DRIP)


### Name: diffLL2K
### Title: local linear kernel difference
### Aliases: diffLL2K
### Keywords: one-sided estimator, jump-preserving

### ** Examples

data(sar) # SAR image is bundled with the package and it is a 
          # standard test image in statistics literature.
diff = diffLL2K(image = sar, bandwidth = 6)



