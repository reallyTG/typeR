library(seqminer)


### Name: readVCFToMatrixByGene
### Title: Read a gene from VCF file and return a genotype matrix
### Aliases: readVCFToMatrixByGene

### ** Examples

fileName = system.file("vcf/all.anno.filtered.extract.vcf.gz", package = "seqminer")
geneFile = system.file("vcf/refFlat_hg19_6col.txt.gz", package = "seqminer")
cfh <- readVCFToMatrixByGene(fileName, geneFile, "CFH", "Synonymous")



