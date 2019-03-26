library(geoSpectral)


### Name: SpcHeaderAdd
### Title: Set a field of the @header slot of a 'SpcHeader' class object
### Aliases: SpcHeaderAdd SpcHeaderAdd,SpcHeader-method

### ** Examples

sp=spc.example_spectra()
sp@header
sp@ShortName
sp@header=SpcHeaderAdd(sp@header,sp@ShortName,10)
sp@header



