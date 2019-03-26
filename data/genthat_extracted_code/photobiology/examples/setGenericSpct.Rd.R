library(photobiology)


### Name: setGenericSpct
### Title: Convert an R object into a spectrum object.
### Aliases: setGenericSpct setCalibrationSpct setRawSpct setCpsSpct
###   setFilterSpct setReflectorSpct setObjectSpct setResponseSpct
###   setSourceSpct setChromaSpct

### ** Examples

my.df <- data.frame(w.length = 300:309, s.e.irrad = rep(100, 10))
is.source_spct(my.df)
setSourceSpct(my.df)
is.source_spct(my.df)




