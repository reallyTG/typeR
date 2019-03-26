library(affxparser)


### Name: convertCel
### Title: Converts a CEL into the same CEL but with another format
### Aliases: convertCel
### Keywords: file IO

### ** Examples

##############################################################
if (require("AffymetrixDataTestFiles")) {            # START #
##############################################################

# Search for some available Calvin CEL files
path <- system.file("rawData", package="AffymetrixDataTestFiles")
files <- findFiles(pattern="[.](cel|CEL)$", path=path, recursive=TRUE, firstOnly=FALSE)
files <- grep("FusionSDK_Test3", files, value=TRUE)
files <- grep("Calvin", files, value=TRUE)
file <- files[1]


outFile <- file.path(tempdir(), gsub("[.]CEL$", ",XBA.CEL", basename(file)))
if (file.exists(outFile))
  file.remove(outFile)
convertCel(file, outFile, .validate=TRUE)


##############################################################
}                                                     # STOP #
##############################################################




