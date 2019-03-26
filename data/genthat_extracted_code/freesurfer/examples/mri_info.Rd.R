library(freesurfer)


### Name: mri_info
### Title: MRI information
### Aliases: mri_info

### ** Examples

if (have_fs()){
   img = oro.nifti::nifti(array(rnorm(5*5*5), dim = c(5,5,5)))  
   mri_info(img)
}



