library(fslr)


### Name: fsl_bin
### Title: Binarize Image using FSL
### Aliases: fsl_bin fslbin

### ** Examples

  set.seed(5)
dims = rep(10, 3)
arr = array(rnorm(prod(dims)), dim = dims)
nim = oro.nifti::nifti(arr)
if (have.fsl()){
 fslbin(nim)
 fsl_bin(nim)
 }




