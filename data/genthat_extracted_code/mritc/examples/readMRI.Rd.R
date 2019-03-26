library(mritc)


### Name: readMRI
### Title: Read an MR Image into an Array
### Aliases: readMRI
### Keywords: utilities

### ** Examples

  ## Not run: 
##D   vol1 <- readMRI("t1.rawb.gz", c(91,109,91), "rawb.gz")
##D   
##D   vol2 <- readMRI("t1.nii.gz", format="nifti")
##D 
##D   vol3  <- readMRI("t1.nii", format="nifti")
##D 
##D   vol4 <- readMRI("t1-analyze.img", format="analyze")
##D   
## End(Not run)



