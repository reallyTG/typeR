library(hsdar)


### Name: meanfilter
### Title: Apply mean filter
### Aliases: meanfilter
### Keywords: smooth

### ** Examples

data(spectral_data)

spectra_filtered <- meanfilter(spectral_data, p = 10)
plot(spectra_filtered[1,])
plot(spectral_data[1,], new = FALSE)

  



