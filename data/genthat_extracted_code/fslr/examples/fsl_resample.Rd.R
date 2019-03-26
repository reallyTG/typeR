library(fslr)


### Name: fsl_resample
### Title: Title
### Aliases: fsl_resample

### ** Examples

if (have_fsl()) {
file = mni_fname(mm = 1, brain = TRUE)
est2 = fsl_resample(file = file, voxel_size = 1, retimg = FALSE)
pixdim(est2)
est = fsl_resample(file = file, voxel_size = 1)
pixdim(est)
}




