library(hsdar)


### Name: dist.speclib
### Title: Distance between spectra
### Aliases: dist.speclib sam sam_distance

### ** Examples

data(spectral_data)

## Mask channel crossing part (around 1050 nm) and strong 
## water absorption part (above 1350 nm)
mask(spectral_data) <- c(1045, 1055, 1350, 1706)

## Calculate distance between all spectra from spring 
## using spectral angle mapper 
dist.speclib(subset(spectral_data, season == "spring"))


## Calculate spectral angle mapper between reference spectrum
## and spectral_data
## Use first spectrum from summer as reference
distance <- sam(subset(spectral_data, season == "spring"), 
                subset(spectral_data, season == "summer")[1,])




