library(geoSpectral)


### Name: spc.setheader<-
### Title: Set a field of the @header slot of a 'Spectra' object
### Aliases: spc.setheader<- spc.setheader<-,Spectra-method

### ** Examples

sp=spc.example_spectra()
a=new("SpcHeader") # create new SpcHeader class
a$Longitude=123 
spc.setheader(sp) <- a
sp@header




