library(freesurfer)


### Name: mri_surf2surf
### Title: Use Freesurfers 'mri_surf2surf' function to resamples one
###   cortical surface onto another
### Aliases: mri_surf2surf

### ** Examples

if (have_fs()) {
   out = mri_surf2surf( 
   subject = 'bert',
   target_subject = 'fsaverage', 
   trg_type  = 'curv', 
   src_type  = 'curv', 
   hemi = "rh",
   sval = "thickness")
} 



