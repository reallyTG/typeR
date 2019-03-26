library(DRIP)


### Name: diffLLK
### Title: local linear kernel difference
### Aliases: diffLLK
### Keywords: one-sided estimator, jump-preserving

### ** Examples

data(sar) # SAR image is bundled with the package and it is a 
          # standard test image in statistics literature.
diff = diffLLK(image = sar, bandwidth = 6)



