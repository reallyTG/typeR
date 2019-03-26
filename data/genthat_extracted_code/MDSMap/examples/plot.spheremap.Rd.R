library(MDSMap)


### Name: plot.spheremap
### Title: Produces diagnostic plots for the estimated map using
###   'calc.maps.sphere'.
### Aliases: plot.spheremap

### ** Examples

map<-calc.maps.sphere(system.file("extdata", "lgI.txt", package="MDSMap"),
weightfn='lod', mapfn='kosambi')
plot(map)



