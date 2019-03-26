library(zooimage)


### Name: zis
### Title: Manipulate .zis files (ZooImage Samples description)
### Aliases: zisCreate zisEdit zisRead
### Keywords: utilities

### ** Examples

## Read content of the example zis file
zisFile <- system.file("examples", "Description.zis", package = "zooimage")
zisData <- zisRead(zisFile)
zisData  # These are data for samples
attr(zisData, "metadata")  # Further data (for the series) here

## Create a new .zis file in tempdir using the example .zis file as template
zisNew <- file.path(tempdir(), "Description.zis")
zisCreate(zisNew, template = zisFile, edit = FALSE)  # One can edit it here too

## Edit the new file, and wait edition is completed
zisEdit(zisNew, wait = TRUE)
## It contains:
if (interactive()) file.show(zisNew, title = basename(zisNew), delete.file = TRUE)

## Clean up
rm(zisFile, zisData, zisNew)



