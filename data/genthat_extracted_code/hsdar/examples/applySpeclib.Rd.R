library(hsdar)


### Name: apply.Speclib
### Title: Apply function for class Speclib
### Aliases: apply.Speclib apply,Speclib-method
### Keywords: utilities

### ** Examples

data(spectral_data)

mean_spectrum <- apply(spectral_data, FUN = mean)
plot(mean_spectrum)

## Same as above but seperately for both seasons
mean_spectra <- apply(spectral_data, FUN = mean, bySI = "season")
plot(mean_spectra[1, ], ylim = c(0,50))
plot(mean_spectra[2, ], new = FALSE)
SI(mean_spectra)




