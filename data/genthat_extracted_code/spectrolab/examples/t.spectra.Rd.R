library(spectrolab)


### Name: t.spectra
### Title: Spectra Transpose
### Aliases: t.spectra

### ** Examples

library(spectrolab)
s = as.spectra(spec_matrix_example, name_idx = 1)

# This will throw an error
## Not run: 
##D t(s)
## End(Not run)
# But these options should work
t(reflectance(s))
t(as.matrix(s))



