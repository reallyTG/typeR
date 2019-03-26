library(photobiology)


### Name: sum_spectra
### Title: Add two spectra
### Aliases: sum_spectra

### ** Examples


head(sun.data)
twice.sun.data <- with(sun.data, sum_spectra(w.length, w.length, s.e.irrad, s.e.irrad))
head(twice.sun.data)
tail(twice.sun.data)




