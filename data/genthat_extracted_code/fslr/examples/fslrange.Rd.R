library(fslr)


### Name: fslrange
### Title: Get range of an image
### Aliases: fslrange

### ** Examples

if (have.fsl()){
 mnifile = file.path(fsldir(), "data", "standard", 
   "MNI152_T1_2mm.nii.gz")
 fslrange(mnifile)
}  



