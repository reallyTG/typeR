library(DRIP)


### Name: diffLCK
### Title: local constant kernel difference
### Aliases: diffLCK
### Keywords: one-sided estimator, jump-preserving

### ** Examples

data(sar) # SAR image is bundled with the package and it is a 
          # standard test image in statistics literature.
diff = diffLCK(image = sar, bandwidth = 4)



