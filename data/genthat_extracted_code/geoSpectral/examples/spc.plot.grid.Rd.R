library(geoSpectral)


### Name: spc.plot.grid
### Title: Plotting 'SpcList' object in a grid
### Aliases: spc.plot.grid spc.plot.grid,SpcList-method

### ** Examples

sp <- spc.example_spectra()
BL = spc.makeSpcList(sp,"CAST")
spc.plot.grid(BL,"spc.plot",3,2)




