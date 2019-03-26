library(freesurfer)


### Name: mnc2nii
### Title: Convert MNC to NIfTI
### Aliases: mnc2nii

### ** Examples

if (have_fs()) {
   img = oro.nifti::nifti(array(rnorm(5*5*5), dim = c(5,5,5)))  
   mnc = nii2mnc(img)
   img_file = mnc2nii(mnc, outfile = tempfile(fileext = ".nii"))
   neurobase::readnii(img_file, verbose = TRUE)
}



