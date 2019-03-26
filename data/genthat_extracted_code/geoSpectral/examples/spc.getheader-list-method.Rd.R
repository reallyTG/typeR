library(geoSpectral)


### Name: spc.getheader,list-method
### Title: Extract a field of the @header slot of a 'SpcList' object
### Aliases: spc.getheader,list-method

### ** Examples

sp=spc.example_spectra()
BL = spc.makeSpcList(sp,"CAST")
BL[[1]]@header
spc.getheader(BL,"CAST")




