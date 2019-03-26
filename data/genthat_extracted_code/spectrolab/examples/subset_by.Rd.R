library(spectrolab)


### Name: subset_by
### Title: Subset spectra by factor
### Aliases: subset_by subset_by.spectra

### ** Examples

library(spectrolab)
spec = as.spectra(spec_matrix_example, name_idx = 1)

# remove spec of species with less than 4 samples
spec = subset_by(spec, by = names(spec), n_min = 4, n_max = Inf)



