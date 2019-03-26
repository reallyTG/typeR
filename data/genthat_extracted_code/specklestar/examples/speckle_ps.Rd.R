library(specklestar)


### Name: speckle_ps
### Title: Power spectrum calculation
### Aliases: speckle_ps

### ** Examples

obj_filename <- system.file("extdata", "ads15182_550_2_frames.dat", package = "specklestar")
midd_dark <- matrix(0, 512, 512)
midd_flat <- matrix(1, 512, 512)
pow_spec <- speckle_ps(obj_filename, dark = midd_dark, flat = midd_flat)



