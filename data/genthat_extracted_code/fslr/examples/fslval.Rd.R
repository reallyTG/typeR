library(fslr)


### Name: fslval
### Title: Get value from FSL header
### Aliases: fslval

### ** Examples

if (have.fsl()){
 mnifile = file.path(fsldir(), "data", "standard", 
   "MNI152_T1_2mm.nii.gz")
 fslval(mnifile, keyword = "dim1")
}  



