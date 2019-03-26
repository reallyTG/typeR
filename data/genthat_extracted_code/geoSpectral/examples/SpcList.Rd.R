library(geoSpectral)


### Name: SpcList
### Title: Constructor function for the 'SpcList' class.
### Aliases: SpcList

### ** Examples

sp=spc.example_spectra()
#Create an SpcList object using two Spectra objects
as(list(sp,sp^2), "SpcList")
#the above is the same as 
SpcList(list(sp,sp^2))




