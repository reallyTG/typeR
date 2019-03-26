library(spectrolab)


### Name: Ops.spectra
### Title: Arithmetic operators for spectra
### Aliases: Ops.spectra

### ** Examples

library(spectrolab)
spec  = as.spectra(spec_matrix_example, name_idx = 1)
spec1 = spec * 2
spec2 = spec + spec
all(spec1 == spec2)



