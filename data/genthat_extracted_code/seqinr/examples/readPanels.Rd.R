library(seqinr)


### Name: readPanels
### Title: Import GenMapper Panels configuration file
### Aliases: readPanels

### ** Examples

#
# Check that we can read the 2 exemple files in the seqinR package:
#
path1 <- system.file("abif/AmpFLSTR_Panels_v1.txt", package = "seqinr")
res1 <- readPanels(path1)
path2 <- system.file("abif/Promega_Panels_v1.txt", package = "seqinr")
res2 <- readPanels(path2)
#
# Show the kits described in res1:
#
names(res1)
#
# Show some data for a given kit:
#
res1[["Identifiler_v1"]][, 1:7]
#
# Plot a simple summary of two kits:
#
par(mfrow = c(2,1))
plotPanels("Identifiler_v1", res1)
plotPanels("PowerPlex_16_v1", res2)

#
# Simple quality check since seqinR 2.0-4 with a file which containing
# a non constant number of tabulations as separator:
#
path3 <- system.file("abif/Prototype_PowerPlex_EP01_Pa.txt", package = "seqinr")
res3 <- readPanels(path3)



