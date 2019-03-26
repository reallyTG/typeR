library(seqminer)


### Name: tabix.read.header
### Title: Read tabix file, similar to running tabix in command line.
### Aliases: tabix.read.header

### ** Examples

fileName = system.file("vcf/all.anno.filtered.extract.vcf.gz", package = "seqminer")
snp <- tabix.read.header(fileName)



