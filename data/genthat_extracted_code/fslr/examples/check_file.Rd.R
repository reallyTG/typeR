library(fslr)


### Name: check_file
### Title: Wrapper for getForms with filename
### Aliases: check_file

### ** Examples

library(fslr)
if (have.fsl()){
 mnifile = file.path(fsldir(), "data", "standard", 
   "MNI152_T1_2mm.nii.gz")
 check_file(mnifile)
} 



