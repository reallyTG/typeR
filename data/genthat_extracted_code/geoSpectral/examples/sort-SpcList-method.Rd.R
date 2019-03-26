library(geoSpectral)


### Name: sort,SpcList-method
### Title: Sort a SpcList object
### Aliases: sort,SpcList-method

### ** Examples

sp <- spc.example_spectra()
#Create an SpcList object (one separate Spectra object for each unique STATION)
spL <- spc.makeSpcList(sp,"STATION")
#Sort all Spectra objects with respect to their rows using the CAST column
spL.s <- sort(spL,which.col="CAST",decreasing=TRUE)
lapply(spL.s, function(x) as.character(x[["CAST"]]))




