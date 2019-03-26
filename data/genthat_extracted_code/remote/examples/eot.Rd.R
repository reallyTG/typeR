library(remote)


### Name: eot
### Title: EOT analysis of a predictor and (optionally) a response
###   RasterStack
### Aliases: eot eot,RasterStackBrick-method

### ** Examples

### EXAMPLE I
### a single field
data(vdendool)

## claculate 2 leading modes
nh_modes <- eot(x = vdendool, y = NULL, n = 2, 
                standardised = FALSE, 
                verbose = TRUE)

plot(nh_modes, y = 1, show.bp = TRUE)
plot(nh_modes, y = 2, show.bp = TRUE)




