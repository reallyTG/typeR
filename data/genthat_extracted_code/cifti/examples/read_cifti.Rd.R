library(cifti)


### Name: read_cifti
### Title: Read CIFTI File
### Aliases: read_cifti readCIFTI readcii

### ** Examples

outdir = tempdir()
if (have_cifti_test_data(outdir = outdir)) {
   files = download_cifti_data(outdir = outdir)
   fname = grep("MyelinAndCorrThickness.32k_fs_LR.dscalar",
   files, value = TRUE)
   res = read_cifti(fname)
}



