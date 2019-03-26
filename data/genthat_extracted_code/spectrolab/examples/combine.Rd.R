library(spectrolab)


### Name: combine
### Title: Combine spectral datasets
### Aliases: combine combine.spectra

### ** Examples

library(spectrolab)

# Create dummy spectra datasets. Pretend that these are all different...
s1 = as.spectra(spec_matrix_example, name_idx = 1)
s2 = as.spectra(spec_matrix_example, name_idx = 1)
s3 = as.spectra(spec_matrix_example, name_idx = 1)

# combine 2 spectra objects
s_1and2 = combine(s1, s2)

# combine n spectra objects using the `Reduce` function
s_n = Reduce(combine, list(s1, s2, s3))



