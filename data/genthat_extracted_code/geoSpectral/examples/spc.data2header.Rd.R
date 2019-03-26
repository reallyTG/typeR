library(geoSpectral)


### Name: spc.data2header
### Title: Populate fields of header slot using data from data slot
### Aliases: spc.data2header spc.data2header,Spectra-method

### ** Examples

sp=spc.example_spectra()
sp=spc.data2header(sp,"CAST")
sp@header
sp=spc.data2header(sp,"CAST","ProjectCast")
sp@header
sp$CAST=rep(33, nrow(sp))
sp=spc.data2header(sp,"CAST","ProjectCast", compress=TRUE)
sp@header




