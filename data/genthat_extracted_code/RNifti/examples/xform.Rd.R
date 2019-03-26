library(RNifti)


### Name: xform
### Title: Obtain or replace the "xform" transforms for an image
### Aliases: xform qform<- sform<- orientation orientation<- rotation

### ** Examples

im <- readNifti(system.file("extdata", "example.nii.gz", package="RNifti"))
xform(im)

# Remove the qform information
qform(im) <- structure(diag(4), code=0L)

# The same as above, since the sform is unmodified
xform(im)

# The identity matrix corresponds to RAS orientation
orientation(diag(4))




