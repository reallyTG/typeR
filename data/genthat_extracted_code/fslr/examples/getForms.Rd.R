library(fslr)


### Name: getForms
### Title: Get Q and S Forms of orientation matrix
### Aliases: getForms

### ** Examples

if (have.fsl()){
 mnifile = file.path(fsldir(), "data", "standard", 
   "MNI152_T1_2mm.nii.gz")
 getForms(mnifile)
}   



