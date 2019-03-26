library(MDSMap)


### Name: MDSMap-package
### Title: High density Genetic Linkage Mapping using Multidimensional
###   Scaling
### Aliases: MDSMap-package

### ** Examples

map<-calc.maps.pc(system.file("extdata", "lgV.txt", package="MDSMap"),
ndim=2,weightfn='lod2',mapfn='kosambi')
plot(map)





