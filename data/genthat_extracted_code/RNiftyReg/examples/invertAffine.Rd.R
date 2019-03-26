library(RNiftyReg)


### Name: invertAffine
### Title: Invert an affine matrix
### Aliases: invertAffine

### ** Examples

affine <- readAffine(system.file("extdata","affine.txt",package="RNiftyReg"))
print(affine)
print(invertAffine(affine))




