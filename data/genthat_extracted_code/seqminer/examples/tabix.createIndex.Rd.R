library(seqminer)


### Name: tabix.createIndex
### Title: Create tabix index file, similar to running tabix in command
###   line.
### Aliases: tabix.createIndex

### ** Examples

fileName = system.file("vcf/all.anno.filtered.extract.vcf.gz", package = "seqminer")
tabix.createIndex(fileName, 1, 2, 0, '#', 0)



