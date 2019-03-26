library(geoSpectral)


### Name: spc.header2data
### Title: Copy header data into the @data slot
### Aliases: spc.header2data spc.header2data,Spectra-method
###   spc.header2data,list-method spc.header2data,SpcList-method

### ** Examples

sp <- spc.example_spectra()
sp <- spc.updateheader(sp,"Zone", "ZoneA")
sp <- spc.header2data(sp, "Zone")
sp$Zone




