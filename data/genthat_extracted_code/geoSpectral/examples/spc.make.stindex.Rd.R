library(geoSpectral)


### Name: spc.make.stindex
### Title: Create a spatio-temporal index based on a list of 'Spectra'
###   objects
### Aliases: spc.make.stindex

### ** Examples

sp = spc.example_spectra()
BL = spc.makeSpcList(sp,"STATION")
stidx = spc.make.stindex(BL)
dim(stidx)
stidx = spc.make.stindex(BL, what2include = "CAST")
head(stidx@data)
stidx = spc.make.stindex(BL, rowSimplify="spc.colMeans")
dim(stidx)




