library(fslr)


### Name: fslhd
### Title: Get NIfTI header using FSL
### Aliases: fslhd

### ** Examples

if (have.fsl()){
 mnifile = file.path(fsldir(), "data", "standard", 
   "MNI152_T1_2mm.nii.gz")
 fslhd(mnifile)
}   



