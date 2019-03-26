library(seqminer)


### Name: readBGENToMatrixByRange
### Title: Read a gene from BGEN file and return a genotype matrix
### Aliases: readBGENToMatrixByRange

### ** Examples

fileName = system.file("bgen/all.anno.filtered.extract.bgen", package = "seqminer")
cfh <- readBGENToMatrixByRange(fileName, "1:196621007-196716634")



