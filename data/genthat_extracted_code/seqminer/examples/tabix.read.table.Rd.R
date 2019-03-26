library(seqminer)


### Name: tabix.read.table
### Title: Read tabix file, similar to running tabix in command line.
### Aliases: tabix.read.table

### ** Examples

fileName = system.file("vcf/all.anno.filtered.extract.vcf.gz", package = "seqminer")
snp <- tabix.read.table(fileName, "1:196623337-196632470")



