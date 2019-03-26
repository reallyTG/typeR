library(specklestar)


### Name: middle_frame
### Title: Middle frame
### Aliases: middle_frame

### ** Examples

obj_filename <- system.file("extdata", "ads15182_550_2_frames.dat", package = "specklestar")
zero_matrix <- matrix(0, 512, 512)
mf <- middle_frame(obj_filename, subtrahend = zero_matrix)



