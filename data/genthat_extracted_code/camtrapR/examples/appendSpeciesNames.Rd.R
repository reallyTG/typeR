library(camtrapR)


### Name: appendSpeciesNames
### Title: Add or remove species names from JPEG image filenames
### Aliases: appendSpeciesNames

### ** Examples

## Not run: 
##D 
##D # copy sample images to another location (so we don't mess around in the package directory)
##D wd_images_ID <- system.file("pictures/sample_images", package = "camtrapR")
##D file.copy(from = wd_images_ID, to = getwd(), recursive = TRUE)       
##D wd_images_ID_copy <- file.path(getwd(), "sample_images")
##D 
##D # append species names
##D SpecNameAppend1 <- appendSpeciesNames(inDir            = wd_images_ID_copy,
##D                                       IDfrom           = "directory",
##D                                       hasCameraFolders = FALSE,
##D                                       removeNames      = FALSE,
##D                                       writecsv         = FALSE)
##D   
##D SpecNameAppend1
##D 
##D # remove species names
##D SpecNameRemove1 <- appendSpeciesNames(inDir            = wd_images_ID_copy,
##D                                       IDfrom           = "directory",
##D                                       hasCameraFolders = FALSE,
##D                                       removeNames      = TRUE,
##D                                       writecsv         = FALSE)
##D   
##D SpecNameRemove1
## End(Not run)



