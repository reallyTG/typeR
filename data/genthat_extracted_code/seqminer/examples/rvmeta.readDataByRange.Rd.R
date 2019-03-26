library(seqminer)


### Name: rvmeta.readDataByRange
### Title: Read association statistics by range from METAL-format files.
###   Both score statistics and covariance statistics will be extracted.
### Aliases: rvmeta.readDataByRange

### ** Examples

scoreFileName = system.file("rvtests/rvtest.MetaScore.assoc.anno.gz", package = "seqminer")
covFileName = system.file("rvtests/rvtest.MetaCov.assoc.gz", package = "seqminer")
geneFile = system.file("vcf/refFlat_hg19_6col.txt.gz", package = "seqminer")
cfh <- rvmeta.readDataByRange(scoreFileName, covFileName, "1:196621007-196716634")



