library(prospectr)


### Name: resample
### Title: Resample spectral data
### Aliases: resample

### ** Examples

data(NIRsoil)
wav <- as.numeric(colnames(NIRsoil$spc))
spc <- 1/10^NIRsoil$spc # conversion to reflectance
resampled <- resample(spc,wav,1100:2498) # increase spectral resolution by 2
dim(spc);dim(resampled)



