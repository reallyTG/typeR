library(photobiology)


### Name: prod_spectra
### Title: Multiply two spectra, even if the wavelengths values differ
### Aliases: prod_spectra

### ** Examples


head(sun.data)
square.sun.data <-
  with(sun.data, prod_spectra(w.length, w.length, s.e.irrad, s.e.irrad))
head(square.sun.data)
tail(square.sun.data)




