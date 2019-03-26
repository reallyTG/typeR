library(geoSpectral)


### Name: spc.Read_ASD
### Title: Read the ASD Spectra from text file
### Aliases: spc.Read_ASD

### ** Examples

filename = file.path(system.file(package = "geoSpectral"),"test_data", "106.064.txt")
L = spc.Read_ASD(filename)
class(L)
spc.plot.plotly(L)




