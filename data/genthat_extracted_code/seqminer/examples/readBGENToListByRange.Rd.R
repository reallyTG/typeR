library(seqminer)


### Name: readBGENToListByRange
### Title: Read information from BGEN file in a given range and return a
###   list
### Aliases: readBGENToListByRange

### ** Examples

fileName = system.file("bgen/all.anno.filtered.extract.bgen", package = "seqminer")
cfh <- readBGENToListByRange(fileName, "1:196621007-196716634")



