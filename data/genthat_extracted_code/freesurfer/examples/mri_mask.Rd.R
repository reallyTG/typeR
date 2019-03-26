library(freesurfer)


### Name: mri_mask
### Title: Use Freesurfers MRI Mask
### Aliases: mri_mask

### ** Examples

if (have_fs()) {
   img = oro.nifti::nifti(array(rnorm(5*5*5), dim = c(5,5,5)))  
   mask = img > 1
   res = mri_mask(img, mask)
}



