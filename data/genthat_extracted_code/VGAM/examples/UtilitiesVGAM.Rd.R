library(VGAM)


### Name: UtilitiesVGAM
### Title: Utility Functions for the VGAM Package
### Aliases: UtilitiesVGAM param.names dimm interleave.VGAM
### Keywords: distribution regression programming models

### ** Examples

param.names("shape", 1)  # "shape"
param.names("shape", 3)  # c("shape1", "shape2", "shape3")

dimm(3, hbw = 1)  # Diagonal matrix; the 3 elements need storage.
dimm(3)  # A general 3 x 3 symmetrix matrix has 6 unique elements.
dimm(3, hbw = 2)  # Tridiagonal matrix; the 3-3 element is 0 and unneeded.

M1 <- 2; ncoly <- 3; M <- ncoly * M1
mynames1 <- param.names("location", ncoly)
mynames2 <- param.names("scale",    ncoly)
(parameters.names <- c(mynames1, mynames2)[interleave.VGAM(M, M1 = M1)])
# The  following is/was in Yee (2015) and has a poor/deceptive style:
(parameters.names <- c(mynames1, mynames2)[interleave.VGAM(M, M  = M1)])
parameters.names[interleave.VGAM(M, M1 = M1, inverse = TRUE)]



