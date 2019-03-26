library(spectrolab)


### Name: [<-.spectra
### Title: Assign reflectance values to spectra
### Aliases: [<-.spectra

### ** Examples

library(spectrolab)
spec = as.spectra(spec_matrix_example, name_idx = 1)
spec[ , 400:500] = spec[ , 400:500] * 1.2
spec



