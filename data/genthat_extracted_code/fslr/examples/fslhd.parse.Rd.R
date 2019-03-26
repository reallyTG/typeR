library(fslr)


### Name: fslhd.parse
### Title: Parse FSL Header
### Aliases: fslhd.parse

### ** Examples

if (have.fsl()){
 mnifile = file.path(fsldir(), "data", "standard", 
   "MNI152_T1_2mm.nii.gz")
 hd = fslhd(mnifile)
 fslhd.parse(hd)
}  



