library(seqminer)


### Name: rvmeta.readCovByRange
### Title: Read covariance by range from METAL-format files.
### Aliases: rvmeta.readCovByRange

### ** Examples

covFileName = system.file("rvtests/rvtest.MetaCov.assoc.gz", package = "seqminer")
cfh <- rvmeta.readCovByRange(covFileName, "1:196621007-196716634")



