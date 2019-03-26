library(zooimage)


### Name: zip
### Title: Zip and unzip raw .tif images for ZooImage and embed metadata
### Aliases: zipImg zipImgAll unzipImg unzipImgAll
### Keywords: utilities

### ** Examples

## Create a fake example of two .tif images and their associated .zim files
testdir <- file.path(tempdir(), "ziptest")
dir.create(testdir)
file.copy(system.file("examples", "BIO.2000-05-05.p72.zid",
    package = "zooimage"), testdir)
curdir <-setwd(testdir)
unzip("BIO.2000-05-05.p72.zid", junkpaths = TRUE)
## Keep only first 3 image plus the .zim file
unlink("BIO.2000-05-05.p72.zid")
unlink("BIO.2000-05-05.p72_dat1.RData")
unlink(dir(pattern = "[.]jpg$")[-(1:3)])
## Rename .jpg images, pretending they are .tif images
jpgFiles <- dir(pattern = "[.]jpg$")
tifFiles <- sub("[.]jpg$", ".tif", jpgFiles)
file.rename(jpgFiles, tifFiles)
## Recreate the .zim file
zimData <- readLines("BIO.2000-05-05.p72+A_dat1.zim", n = 32)
zimFile <- "BIO.2000-05-05.p72+A_.zim"
writeLines(zimData, zimFile)
unlink("BIO.2000-05-05.p72+A_dat1.zim")
## Here is what we got...
dir()

## Zip first image...
(zipImg(tifFiles[1]))
## It is added in the _raw subdirectory
dir()
zipDir <- file.path(".", "_raw")
dir(zipDir)

## Now, zip all images in batch and delete sources
(zipImgAll(".", delete.source = TRUE))
dir() # .zim files are never deleted!
(zipFiles <- dir(zipDir, full.names = TRUE)) # All three are there
## Force delete of the .zim file
unlink(zimFile)

## Unzip first zip file...
#####(unzipImg(zipFiles[1]))
## The image and .zim file are recreated
dir()
## Check extracted .zim file
#####all(readLines(zimFile) == zimData)

## Unzip all images...
(unzipImgAll(zipDir, replace = TRUE, delete.source = TRUE))
## All original files are there...
dir()
## and the _raw subdir is now empty
dir(zipDir)

## Reset and clean up
setwd(curdir)
unlink(testdir, recursive = TRUE)
rm(testdir, curdir, jpgFiles, tifFiles, zimFile, zimData, zipDir, zipFiles)



