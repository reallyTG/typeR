library(seqminer)


### Name: readVCFToMatrixByRange
### Title: Read a gene from VCF file and return a genotype matrix
### Aliases: readVCFToMatrixByRange

### ** Examples

fileName = system.file("vcf/all.anno.filtered.extract.vcf.gz", package = "seqminer")
cfh <- readVCFToMatrixByRange(fileName, "1:196621007-196716634", "Nonsynonymous")



