library(seqminer)


### Name: rvmeta.readDataByGene
### Title: Read association statistics by gene from METAL-format files.
###   Both score statistics and covariance statistics will be extracted.
### Aliases: rvmeta.readDataByGene

### ** Examples

scoreFileName = system.file("rvtests/rvtest.MetaScore.assoc.anno.gz", package = "seqminer")
covFileName = system.file("rvtests/rvtest.MetaCov.assoc.gz", package = "seqminer")
geneFile = system.file("vcf/refFlat_hg19_6col.txt.gz", package = "seqminer")
cfh <- rvmeta.readDataByGene(scoreFileName, covFileName, geneFile, "CFH")



