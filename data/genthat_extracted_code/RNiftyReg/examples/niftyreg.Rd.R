library(RNiftyReg)


### Name: niftyreg
### Title: Two and three dimensional image registration
### Aliases: niftyreg as.array.niftyreg

### ** Examples

## Not run: 
##D source <- readNifti(system.file("extdata", "epi_t2.nii.gz",
##D   package="RNiftyReg"))
##D target <- readNifti(system.file("extdata", "flash_t1.nii.gz",
##D   package="RNiftyReg"))
##D 
##D result <- niftyreg(source, target, scope="affine")
## End(Not run)




