library(photobiology)


### Name: subt_spectra
### Title: Subtract two spectra
### Aliases: subt_spectra

### ** Examples


head(sun.data)
zero.data <- with(sun.data, subt_spectra(w.length, w.length, s.e.irrad, s.e.irrad))
head(zero.data)
tail(zero.data)




