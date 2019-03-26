library(seqminer)


### Name: rvmeta.readSkewByRange
### Title: Read skew by range from METAL-format files.
### Aliases: rvmeta.readSkewByRange

### ** Examples

skewFileName = system.file("rvtests/rvtest.MetaSkew.assoc.gz", package = "seqminer")
cfh <- rvmeta.readSkewByRange(skewFileName, "1:196621007-196716634")



