library(MDSMap)


### Name: calc.maps.pc
### Title: Estimate marker positions using Principal Curves
### Aliases: calc.maps.pc

### ** Examples

map<-calc.maps.pc(system.file("extdata", "lgV.txt", package="MDSMap"),
ndim=2,weightfn='lod2',mapfn='kosambi')
plot(map)



