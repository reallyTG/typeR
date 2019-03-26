library(SpatialExtremes)


### Name: gev2frech
### Title: Transforms GEV data to unit Frechet ones and vice versa
### Aliases: gev2frech frech2gev
### Keywords: datagen

### ** Examples

x <- c(2.2975896, 1.6448808, 1.3323833, -0.4464904, 2.2737603,
    -0.2581876, 9.5184398, -0.5899699, 0.4974283, -0.8152157)
y <- gev2frech(x, 1, 2, .2)
y
frech2gev(y, 1, 2, .2)



