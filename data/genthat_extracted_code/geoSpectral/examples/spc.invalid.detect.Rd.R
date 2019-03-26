library(geoSpectral)


### Name: spc.invalid.detect
### Title: Determinate invalid rows of a 'Spectra' object
### Aliases: spc.invalid.detect spc.invalid.detect,Spectra-method
###   spc.invalid.detect,list-method

### ** Examples

sp=spc.example_spectra()
nrow(sp)
invalid=spc.invalid.detect(sp)
show(invalid); length(invalid)

BL = spc.makeSpcList(sp,"CAST")
invalid=spc.invalid.detect(BL)
show(invalid)




