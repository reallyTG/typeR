library(LCF)


### Name: bkg_corr
### Title: Background correction function
### Aliases: bkg_corr
### Keywords: correction, flattening normalization,

### ** Examples

data(stdmix)
corr.spec.samples <- initial_load(specdat[5:8], 
  corr.norm = c(-36, -15, 37, 58))
corr.spec <- bkg_corr(raw.spec = corr.spec.samples[[1]], 
  corr.norm = c(-36, -15, 37, 58))
print(corr.spec)



