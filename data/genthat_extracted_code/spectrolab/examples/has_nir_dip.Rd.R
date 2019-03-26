library(spectrolab)


### Name: has_nir_dip
### Title: Has a dip in the NIR region?
### Aliases: has_nir_dip

### ** Examples

library(spectrolab)
spec  = as.spectra(spec_matrix_example, name_idx = 1)

# Find spec with NIR dip
# Set parallel = TRUE if many samples need testing.
dip = has_nir_dip(spec, parallel = FALSE)

# remove NIR dip
spec = spec[ ! dip, ]



