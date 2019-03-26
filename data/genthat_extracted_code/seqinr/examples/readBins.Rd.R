library(seqinr)


### Name: readBins
### Title: Import GenMapper Bins configuration file
### Aliases: readBins

### ** Examples

#
# Check that we can read the 2 exemple files in the seqinR package:
#
path1 <- system.file("abif/AmpFLSTR_Bins_v1.txt", package = "seqinr")
resbin1 <- readBins(path1)
path2 <- system.file("abif/Promega_Bins_v1.txt", package = "seqinr")
resbin2 <- readBins(path2)
#
# Show the kits described in resbin1:
#
names(resbin1)
#
# Show the markers in a given kit:
#
names(resbin1[["Identifiler_v1"]])
#
# Show alleles expected sizes for a given marker:
#
resbin1[["Identifiler_v1"]][["D8S1179"]]
#
# Simple quality check since seqinr 2.0-4 with a configuration file
# containing trailling tabulations:
#
path3 <- system.file("abif/Prototype_PowerPlex_EP01_Bins.txt", package = "seqinr")
resbin3 <- readBins(path3)
ncols <- sapply(resbin3[[2]], ncol)
stopifnot(all(ncols == 4))



