library(spectrolab)


### Name: ratio
### Title: Pairwise reflectance ratios
### Aliases: ratio ratio.spectra

### ** Examples

library(spectrolab)

# Ratios of visible part of the spectrum
spec = as.spectra(spec_matrix_example, name_idx = 1)[ , 400:700 ]
spec_ratio_mat = ratio(spec)



