library(geoSpectral)


### Name: spc.lapply
### Title: Apply a function over a Spclist
### Aliases: spc.lapply spc.lapply,SpcList-method

### ** Examples

 
sp=spc.example_spectra()
BL=spc.makeSpcList(sp,"CAST")
#Counts rows (returns a list object)
spc.lapply(BL,function(x) {nrow(x)})
#Perform arithmetic operations on all Spectra elements. Returns a SpcList object.
spc.lapply(BL,function(x) {x^2+1})




