library(spm12r)


### Name: bwconncomp
### Title: Label Connected Clusters of Certain Size
### Aliases: bwconncomp

### ** Examples

library(neurobase)
set.seed(1234)
dims = c(30, 30, 10)
arr = array(rnorm(prod(dims)), dim = dims)
nim = nifti(arr)
mask = datatyper(nim > 1)
## Not run: 
##D cc = bwconncomp(mask)
##D tab = table(c(cc))
## End(Not run)



