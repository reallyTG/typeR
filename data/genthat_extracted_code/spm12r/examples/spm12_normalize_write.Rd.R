library(spm12r)


### Name: spm12_normalize_write
### Title: SPM12 Normalize (Write)
### Aliases: spm12_normalize_write build_spm12_normalize_write

### ** Examples

dims = rep(10, 3)
temp_nii = array(rnorm(prod(dims)), dim = dims)
temp_nii = oro.nifti::nifti(temp_nii)
res = build_spm12_normalize_write(temp_nii, 
other.files = temp_nii,
install_dir = tempdir())



