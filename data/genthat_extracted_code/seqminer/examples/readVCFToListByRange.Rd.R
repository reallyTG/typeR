library(seqminer)


### Name: readVCFToListByRange
### Title: Read information from VCF file in a given range and return a
###   list
### Aliases: readVCFToListByRange

### ** Examples

fileName = system.file("vcf/all.anno.filtered.extract.vcf.gz", package = "seqminer")
cfh <- readVCFToListByRange(fileName, "1:196621007-196716634", "Nonsynonymous",
                            c("CHROM", "POS"), c("AF", "AC"), c("GT") )



