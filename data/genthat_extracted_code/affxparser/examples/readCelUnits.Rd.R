library(affxparser)


### Name: readCelUnits
### Title: Reads probe-level data ordered as units (probesets) from one or
###   several Affymetrix CEL files
### Aliases: readCelUnits
### Keywords: file IO

### ** Examples

##############################################################
if (require("AffymetrixDataTestFiles")) {            # START #
##############################################################

# Search for some available CEL files
path <- system.file("rawData", package="AffymetrixDataTestFiles")
files <- findFiles(pattern="[.](cel|CEL)$", path=path, recursive=TRUE, firstOnly=FALSE)
files <- grep("FusionSDK_Test3", files, value=TRUE)
files <- grep("Calvin", files, value=TRUE)

# Fake more CEL files if not enough
files <- rep(files, length.out=5)
print(files);
rm(files);


##############################################################
}                                                     # STOP #
##############################################################



