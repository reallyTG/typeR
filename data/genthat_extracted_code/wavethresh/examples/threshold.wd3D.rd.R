library(wavethresh)


### Name: threshold.wd3D
### Title: Threshold 3D DWT object
### Aliases: threshold.wd3D
### Keywords: smooth nonlinear

### ** Examples

#
# Generate some test data
#
test.data <- array(rnorm(8*8*8), dim=c(8,8,8))
testwd3D <- wd3D(test.data)
#
# Now let's threshold
#
testwd3DT <- threshold(testwd3D, levels=1:2)
#
# That's it, one can apply wr3D now to reconstruct
# if you like!
#



