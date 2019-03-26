library(zooimage)


### Name: file-utilities
### Title: Various file utility functions used by ZooImage
### Aliases: extensionPattern hasExtension noExtension listFilesExt zimList
###   zimDatList zipList zidList zidbList jpgList pngList checkFileExists
###   checkDirExists checkEmptyDir forceDirCreate checkFirstLine
### Keywords: utilities

### ** Examples

# Construct a suitable pattern to match extensions of TIFF image files
extensionPattern("tif")
# Test if file names match given extensions (first 2 items only)
hasExtension(c("test1.tif", "test2.TIF", "test3.R"), "tif")
noExtension(c("test1.tif", "test2.TIF", "test3.R"))

# List all files with a given extension in a directory
ziDir <- system.file("examples", package = "zooimage")
listFilesExt(ziDir, "zid")
zidList(ziDir) # Idem

# Check that a file or a directory exists
checkDirExists(ziDir)
zisFile <- file.path(ziDir, "Description.zis")
checkFileExists(zisFile)

# Is this directory empty? (no)
checkEmptyDir(ziDir)

# force (re)creation of a directory
tmpDir <- file.path(tempdir(), "testdir")
forceDirCreate(tmpDir)
file.info(tmpDir)$isdir # yes
checkEmptyDir(tmpDir)   # yes
file.remove(tmpDir)
file.exists(tmpDir)

# Every .zis file must start with ZI1-5 => check this...
checkFirstLine(zisFile)

# Clean up
rm(ziDir, zisFile, tmpDir)



