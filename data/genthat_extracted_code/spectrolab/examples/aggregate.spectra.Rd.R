library(spectrolab)


### Name: aggregate.spectra
### Title: Aggregate spectra
### Aliases: aggregate.spectra

### ** Examples

library(spectrolab)
spec = as.spectra(spec_matrix_example, name_idx = 1)
spec_mean = aggregate(spec, by = names(spec), mean, try_keep_txt(mean))



