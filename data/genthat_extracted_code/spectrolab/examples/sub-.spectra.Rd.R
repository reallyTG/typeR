library(spectrolab)


### Name: [.spectra
### Title: Subset spectra
### Aliases: [.spectra

### ** Examples

library(spectrolab)
spec = as.spectra(spec_matrix_example, name_idx = 1)
head(names(spec), n = 3)
# by name
spec1 = spec[ "species_7" , ]
spec1
# by band
spec2 = spec[ , 400:700 ]
spec2



