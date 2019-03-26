library(MDSMap)


### Name: plot.pcmap
### Title: Diagnostic plots for the map estimation using calc.maps.pc with
###   2 dimensions.
### Aliases: plot.pcmap

### ** Examples

map<-calc.maps.pc(system.file("extdata", "lgV.txt", package="MDSMap"),
ndim=2,weightfn='lod2',mapfn='haldane')
plot(map)



