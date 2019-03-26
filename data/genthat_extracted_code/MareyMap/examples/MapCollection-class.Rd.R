library(MareyMap)


### Name: MapCollection-class
### Title: Class "MapCollection"
### Aliases: MapCollection,missing-method MapCollection MapCollection-class
###   [,MapCollection-method [[<-,MapCollection,ANY,ANY,MapSet-method
###   [[<-,MapCollection,ANY,ANY,MareyMap-method [[,MapCollection-method
###   $,MapCollection-method +,MapCollection,MareyMap-method
###   +,MapCollection,MapSet-method +,MapCollection,MapCollection-method
###   -,MapCollection,character-method
###   coerce,MapCollection,data.frame-method setNames,MapCollection-method
###   length,MapCollection-method textFile,MapCollection,character-method
### Keywords: classes

### ** Examples

data(Homo_sapiens_mean)
map1 <- Homo_sapiens_mean[["Chromosome 01"]]
# do some useful changes to the map...
mapName(map1)<- "Chrom 1 (modified)"



