library(mutSignatures)


### Name: extractSignatures
### Title: Extract Signatures from Genomic Mutational Catalogs
### Aliases: extractSignatures

### ** Examples

tmp <- getTestRunArgs()
extractSignatures(mutCountMatrix = tmp$mutCount.obj$mutCounts[1:10,1:3], params = tmp$params)



