library(xpose4)


### Name: export.variable.definitions
### Title: Exports Xpose variable definitions to a file from an Xpose data
###   object.
### Aliases: export.variable.definitions
### Keywords: methods

### ** Examples

od = setwd(tempdir()) # move to a temp directory
(cur.files <- dir()) # current files in temp directory

export.variable.definitions(simpraz.xpdb,file="xpose.vardefs.ini")
(new.files <- dir()[!(dir() %in% cur.files)])  # what files are new here?

file.remove(new.files) # remove this file
setwd(od)  # restore working directory





