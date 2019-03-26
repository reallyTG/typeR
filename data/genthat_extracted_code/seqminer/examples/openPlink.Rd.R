library(seqminer)


### Name: openPlink
### Title: Open binary PLINK files
### Aliases: openPlink

### ** Examples

fileName = system.file("plink/all.anno.filtered.extract.bed", package = "seqminer")
fileName = sub(fileName, pattern = ".bed", replacement = "")
plinkObj <- openPlink(fileName)
str(plinkObj)



