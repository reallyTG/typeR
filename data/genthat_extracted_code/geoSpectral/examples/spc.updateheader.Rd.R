library(geoSpectral)


### Name: spc.updateheader
### Title: Update a field of the @header slot of a 'Spectra' object
### Aliases: spc.updateheader spc.updateheader,Spectra-method
###   spc.updateheader,list-method

### ** Examples

sp=spc.example_spectra()
sp@header
sp <- spc.updateheader(sp,"Station", 11)
sp@header

#SpcList example
sp=spc.example_spectra()
BL=spc.makeSpcList(sp,"CAST")
BL[[1]]@header
BL[[1]] <- spc.updateheader(BL[[1]],"Station", 11)
BL[[1]]@header




