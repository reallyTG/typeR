library(spm12r)


### Name: build_spm12_realign
### Title: SPM12 Realign (Estimate and Reslice)
### Aliases: build_spm12_realign spm12_realign

### ** Examples

dims = rep(10, 4)
temp_nii = array(rnorm(prod(dims)), dim = dims)
temp_nii = oro.nifti::nifti(temp_nii)
res = build_spm12_realign(temp_nii)




