library(spectrolab)


### Name: resample
### Title: Resample spectra
### Aliases: resample resample.spectra

### ** Examples

library(spectrolab)
spec = as.spectra(spec_matrix_example, name_idx = 1)
spec = resample(spec, new_wvls = seq(400, 2400, 0.5), parallel = FALSE)



