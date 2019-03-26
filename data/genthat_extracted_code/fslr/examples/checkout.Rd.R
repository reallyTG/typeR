library(fslr)


### Name: checkout
### Title: Determine of Q and S forms are consistent
### Aliases: checkout

### ** Examples

if (have.fsl()){
 mnifile = file.path(fsldir(), "data", "standard", 
   "MNI152_T1_2mm.nii.gz")
 forms = getForms(mnifile)
 checkout(forms)
} 



