library(spectrolab)


### Name: meta<-
### Title: Set metadata
### Aliases: meta<-

### ** Examples

library(spectrolab)
spec = as.spectra(spec_matrix_example, name_idx = 1)
meta(spec, "random") = rnorm(nrow(spec), mean(10), sd = 2)



