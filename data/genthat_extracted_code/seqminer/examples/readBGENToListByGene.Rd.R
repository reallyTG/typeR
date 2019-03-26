library(seqminer)


### Name: readBGENToListByGene
### Title: Read information from BGEN file in a given range and return a
###   list
### Aliases: readBGENToListByGene

### ** Examples

fileName = system.file("bgen/all.anno.filtered.extract.bgen", package = "seqminer")
geneFile = system.file("vcf/refFlat_hg19_6col.txt.gz", package = "seqminer")
cfh <- readBGENToListByGene(fileName, geneFile, "CFH")



