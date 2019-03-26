library(camtrapR)


### Name: timeShiftImages
### Title: Apply time shifts to JPEG image metadata
### Aliases: timeShiftImages

### ** Examples


## Not run: 
##D 
##D # copy sample images to temporary directory (so we don't mess around in the package directory)
##D wd_images_ID <- system.file("pictures/sample_images", package = "camtrapR")
##D file.copy(from = wd_images_ID, to = tempdir(), recursive = TRUE)
##D wd_images_ID_copy <- file.path(tempdir(), "sample_images")
##D 
##D data(timeShiftTable)
##D 
##D 
##D timeshift_run <- timeShiftImages(inDir                = wd_images_ID_copy,
##D                                  timeShiftTable       = timeShiftTable,
##D                                  stationCol           = "Station",
##D                                  hasCameraFolders     = FALSE,
##D                                  timeShiftColumn      = "timeshift",
##D                                  timeShiftSignColumn  = "sign",
##D                                  undo                 = FALSE
##D )
##D 
##D 
##D timeshift_undo <- timeShiftImages(inDir               = wd_images_ID_copy,
##D                                   timeShiftTable      = timeShiftTable,
##D                                   stationCol          = "Station",
##D                                   hasCameraFolders    = FALSE,
##D                                   timeShiftColumn     = "timeshift",
##D                                   timeShiftSignColumn = "sign",
##D                                   undo                = TRUE
##D )
## End(Not run)



