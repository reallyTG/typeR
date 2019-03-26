library(seqminer)


### Name: rvmeta.writeScoreData
### Title: Write score-based association statistics files.
### Aliases: rvmeta.writeScoreData

### ** Examples

scoreFileName = system.file("rvtests/rvtest.MetaScore.assoc.anno.gz", package = "seqminer")
covFileName = system.file("rvtests/rvtest.MetaCov.assoc.gz", package = "seqminer")
geneFile = system.file("vcf/refFlat_hg19_6col.txt.gz", package = "seqminer")
cfh <- rvmeta.readDataByRange(scoreFileName, covFileName, "1:196621007-196716634")
rvmeta.writeScoreData(cfh, "cfh.MetaScore.assoc")



