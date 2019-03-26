library(geoSpectral)


### Name: spc.setheader<-,list-method
### Title: Set a field of the @header slot of a 'SpcList' object
### Aliases: spc.setheader<-,list-method

### ** Examples

sp=spc.example_spectra()
BL=spc.makeSpcList(sp,"CAST")
a=new("SpcHeader") # create new SpcHeader class
a$Longitude=123 
spc.setheader(BL[[1]]) <- a
h=spc.getheader(BL[[1]])
h




