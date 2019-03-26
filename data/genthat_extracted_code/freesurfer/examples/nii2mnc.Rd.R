library(freesurfer)


### Name: nii2mnc
### Title: Convert NIfTI to MNC
### Aliases: nii2mnc

### ** Examples

if (have_fs()) {
   img = oro.nifti::nifti(array(rnorm(5*5*5), dim = c(5,5,5)))  
   mnc = nii2mnc(img)
   img_file = mnc2nii(mnc)
}



