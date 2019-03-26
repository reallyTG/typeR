library(seqminer)


### Name: rvmeta.writeCovData
### Title: Write covariance association statistics files.
### Aliases: rvmeta.writeCovData

### ** Examples

scoreFileName = system.file("rvtests/rvtest.MetaScore.assoc.anno.gz", package = "seqminer")
covFileName = system.file("rvtests/rvtest.MetaCov.assoc.gz", package = "seqminer")
geneFile = system.file("vcf/refFlat_hg19_6col.txt.gz", package = "seqminer")
cfh <- rvmeta.readDataByRange(scoreFileName, covFileName, "1:196621007-196716634")
rvmeta.writeCovData(cfh, "cfh.MetaCov.assoc.gz")



