library(seqminer)


### Name: rvmeta.readScoreByRange
### Title: Read score test statistics by range from METAL-format files.
### Aliases: rvmeta.readScoreByRange

### ** Examples

scoreFileName = system.file("rvtests/rvtest.MetaScore.assoc.anno.gz", package = "seqminer")
cfh <- rvmeta.readScoreByRange(scoreFileName, "1:196621007-196716634")



