library(MareyMap)


### Name: MapSet-class
### Title: Class "MapSet"
### Aliases: MapSet MapSet-class -,MapSet,character-method [,MapSet-method
###   [[<-,MapSet,ANY,ANY,MareyMap-method [[,MapSet-method $,MapSet-method
###   +,MapSet,MareyMap-method coerce,MapSet,data.frame-method
###   mapNames,MapSet-method setName<-,MapSet,character-method
###   setName,MapSet-method length,MapSet-method
###   textFile,MapSet,character-method
### Keywords: classes

### ** Examples

data(Homo_sapiens_mean)
set <- Homo_sapiens_mean
setName(set) <- "Human"
set[["Chromosome 01"]]



