library(seqminer)


### Name: [.PlinkFile
### Title: Read a gene from BGEN file and return a genotype matrix
### Aliases: [.PlinkFile

### ** Examples

## these indice are nonsynonymous markers for 1:196621007-196716634",
## refer to the readVCFToMatrixByRange()
fileName = system.file("plink/all.anno.filtered.extract.bed", package = "seqminer")
filePrefix = sub(fileName, pattern = ".bed", replacement = "")
plinkObj = openPlink(filePrefix)
sampleIndex = seq(3)
markerIndex =c(14, 36)
cfh <- plinkObj[sampleIndex, markerIndex]



