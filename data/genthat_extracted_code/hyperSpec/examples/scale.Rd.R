library(hyperSpec)


### Name: scale,hyperSpec-method
### Title: Center and scale hyperSpec object
### Aliases: scale,hyperSpec-method scale scale-methods
### Keywords: methods

### ** Examples


## mean center & variance scale
tmp <- scale (chondro)
plot (tmp, "spcmeansd")
plot (sample (tmp, 5), add = TRUE, col = 2)

## mean center only
tmp <- scale (chondro, scale = FALSE)
plot (tmp, "spcmeansd")
plot (sample (tmp, 5), add = TRUE, col = 2)

## custom center
tmp <- sweep (chondro, 1, mean, `/`)
plot (tmp, "spcmeansd")
tmp <- scale (tmp, center = quantile (tmp, .05), scale = FALSE)




