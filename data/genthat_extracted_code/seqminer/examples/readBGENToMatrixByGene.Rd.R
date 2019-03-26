library(seqminer)


### Name: readBGENToMatrixByGene
### Title: Read a gene from BGEN file and return a genotype matrix
### Aliases: readBGENToMatrixByGene

### ** Examples

fileName = system.file("bgen/all.anno.filtered.extract.bgen", package = "seqminer")
geneFile = system.file("vcf/refFlat_hg19_6col.txt.gz", package = "seqminer")
cfh <- readBGENToMatrixByGene(fileName, geneFile, "CFH")



