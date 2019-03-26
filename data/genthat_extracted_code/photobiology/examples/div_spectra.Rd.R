library(photobiology)


### Name: div_spectra
### Title: Divide two spectra, even if the wavelengths values differ
### Aliases: div_spectra

### ** Examples


head(sun.data)
one.data <- with(sun.data, div_spectra(w.length, w.length, s.e.irrad, s.e.irrad))
head(one.data)
tail(one.data)




