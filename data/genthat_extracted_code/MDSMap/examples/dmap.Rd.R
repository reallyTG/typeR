library(MDSMap)


### Name: dmap
### Title: Calculates pairwise map distances from the recombination
###   fraction.
### Aliases: dmap

### ** Examples

lodrf<-calc.pair.rf.lod(system.file("extdata", "lgV.txt", package="MDSMap"))
mdist=dmap(lodrf$rf,mapfn="haldane")



