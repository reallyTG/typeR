library(colorscience)


### Name: spectra2CCT
### Title: Correlated Color Temperature (CCT) from spectra
### Aliases: spectra2CCT
### Keywords: datasets

### ** Examples

# illuminant A
SPD = illuminants[1:51*2-1,c('wlnm','A')] # every 10 nm
CCT <- spectra2CCT(SPD)
CCT



