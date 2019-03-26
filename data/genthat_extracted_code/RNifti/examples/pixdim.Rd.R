library(RNifti)


### Name: pixdim
### Title: Pixel dimensions and units
### Aliases: pixdim pixdim.default pixdim<- pixdim<-.default pixunits
###   pixunits.default pixunits<- pixunits<-.default

### ** Examples

im <- readNifti(system.file("extdata", "example.nii.gz", package="RNifti"))
pixdim(im)
pixunits(im)




