library(specklestar)


### Name: speckle_acf
### Title: Autocorrelation function calculation
### Aliases: speckle_acf

### ** Examples

obj_filename <- system.file("extdata", "ads15182_550_2_frames.dat", package = "specklestar")
pow_spec_diff <- speckle_ps_diff(obj_filename)
acf <- speckle_acf(pow_spec_diff)



