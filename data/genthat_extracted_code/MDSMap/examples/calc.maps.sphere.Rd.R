library(MDSMap)


### Name: calc.maps.sphere
### Title: Estimate marker positions using spherically constrained weighted
###   MDS
### Aliases: calc.maps.sphere

### ** Examples

smap<-calc.maps.sphere(system.file("extdata", "lgI.txt", package="MDSMap"),
weightfn='lod',mapfn='kosambi')



