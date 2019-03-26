library(photobiology)


### Name: oper_spectra
### Title: Binary operation on two spectra, even if the wavelengths values
###   differ
### Aliases: oper_spectra

### ** Examples


head(sun.data)
result.data <-
    with(sun.data,
         oper_spectra(w.length, w.length, s.e.irrad, s.e.irrad, bin.oper=`+`))
head(result.data)
tail(result.data)
my_fun <- function(e1, e2, k) {return((e1 + e2) / k)}
result.data <-
    with(sun.data,
        oper_spectra(w.length, w.length, s.e.irrad, s.e.irrad, bin.oper=my_fun, k=2))
head(result.data)
tail(result.data)




