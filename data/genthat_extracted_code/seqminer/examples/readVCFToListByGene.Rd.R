library(seqminer)


### Name: readVCFToListByGene
### Title: Read information from VCF file in a given range and return a
###   list
### Aliases: readVCFToListByGene

### ** Examples

fileName = system.file("vcf/all.anno.filtered.extract.vcf.gz", package = "seqminer")
geneFile = system.file("vcf/refFlat_hg19_6col.txt.gz", package = "seqminer")
cfh <- readVCFToListByGene(fileName, geneFile, "CFH", "Synonymous",
                           c("CHROM", "POS"), c("AF", "AC"), c("GT") )



