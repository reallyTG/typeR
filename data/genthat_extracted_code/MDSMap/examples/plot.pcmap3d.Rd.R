library(MDSMap)


### Name: plot.pcmap3d
### Title: Diagnostic plots for the map estimation using calc.maps.pc with
###   3 dimensions.
### Aliases: plot.pcmap3d

### ** Examples

map<-calc.maps.pc(system.file("extdata", "lgV.txt", package="MDSMap"),
ndim=3,weightfn='lod2',mapfn='haldane')
plot(map)



