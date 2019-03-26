library(fslr)


### Name: fsl_smoothest
### Title: Smoothness Estimation using 'smoothest'
### Aliases: fsl_smoothest

### ** Examples

if (have_fsl()) {
file = mni_fname(mm = 2, brain = TRUE, mask = TRUE)
img = mni_img(mm = 2, brain = TRUE, mask = FALSE)
mask = mni_img(mm = 2, brain = TRUE, mask = TRUE)
img = zscore_img(img = img, mask = mask)
est = fsl_smoothest(file = file, z_image = img)
}



