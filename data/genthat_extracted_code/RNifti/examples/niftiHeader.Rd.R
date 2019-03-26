library(RNifti)


### Name: niftiHeader
### Title: Dump or construct a raw NIfTI or ANALYZE header
### Aliases: niftiHeader dumpNifti analyzeHeader print.niftiHeader
###   print.analyzeHeader

### ** Examples

niftiHeader(system.file("extdata", "example.nii.gz", package="RNifti"))

# Default header for a standard R array
niftiHeader(array(0L, dim=c(10,10)))




