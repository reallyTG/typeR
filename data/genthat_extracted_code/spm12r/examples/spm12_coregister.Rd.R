library(spm12r)


### Name: build_spm12_coregister
### Title: Batch SPM12 Coregister (Estimate and Reslice)
### Aliases: build_spm12_coregister build_spm12_coregister_estimate
###   build_spm12_coregister_reslice spm12_coregister_wrapper
###   spm12_coregister spm12_coregister_estimate spm12_coregister_reslice

### ** Examples

## Not run: 
##D fname = paste0("~/Desktop/D2/scratch/", 
##D "100-318_20070723_0957_CT_3_CT_Head-_SS_0.01_SyN_ROI.nii.gz")
##D spm = spm12_coregister(
##D fixed = fname,
##D moving = fname, 
##D other.files = fname,
##D execute = FALSE)
## End(Not run)
if (matlabr::have_matlab()) {
install_dir = tempdir()
dims = rep(10, 3)
fixed = array(rnorm(prod(dims)), dim = dims)
fixed = oro.nifti::nifti(fixed)
moving = array(rnorm(prod(dims)), dim = dims)
moving = oro.nifti::nifti(moving) 
res = build_spm12_coregister(
fixed = fixed, moving = moving,
install_dir = install_dir)
}



