library(fslr)


### Name: fslmax
### Title: Get min/max of an image
### Aliases: fslmax fslmin

### ** Examples

if (have.fsl()){
 mnifile = file.path(fsldir(), "data", "standard", 
   "MNI152_T1_2mm.nii.gz")
 fslmax(mnifile)
}  



