library(LCF)


### Name: initial_load
### Title: Initial loading of spectra
### Aliases: initial_load
### Keywords: correction normalization,

### ** Examples

data(stdmix)
corr.spec.standards  <- initial_load(specdat[1:4], 
  corr.norm = c(-36, -15, 37, 58))
corr.spec.samples    <- initial_load(specdat[5:8], 
  corr.norm = c(-36, -15, 37, 58))



