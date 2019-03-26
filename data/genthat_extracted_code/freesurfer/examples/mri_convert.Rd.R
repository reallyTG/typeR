library(freesurfer)


### Name: mri_convert
### Title: Use Freesurfers MRI Converter
### Aliases: mri_convert

### ** Examples

if (have_fs()) {
   img = oro.nifti::nifti(array(rnorm(5*5*5), dim = c(5,5,5))) 
   res = mri_convert(img, outfile = tempfile(fileext = ".mgz"))
} 



