library(geoSpectral)


### Name: sort,Spectra-method
### Title: Sort a Spectra object
### Aliases: sort,Spectra-method

### ** Examples

sp <- spc.example_spectra()
sp2 <- sort(sp, which.col="Offset")
sp2$Offset
sp2 <- sort(sp, which.col="CAST", decreasing=TRUE)
sp2$CAST




