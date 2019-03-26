library(camtrapR)


### Name: createStationFolders
### Title: Create camera trap station directories for raw camera trap
###   images
### Aliases: createStationFolders

### ** Examples

## Not run: 
##D 
##D # create dummy directory for tests (this will be used as inDir)
##D # (normally, you'd set up an empty directory, e.g. .../myStudy/rawImages)
##D wd_createStationDir <- file.path(tempdir(), "createStationFoldersTest")
##D 
##D # now we load the sample camera trap station data frame
##D data(camtraps)
##D 
##D # create station directories in wd_createStationDir
##D StationFolderCreate1 <- createStationFolders (inDir       = wd_createStationDir,
##D                                               stations    = as.character(camtraps$Station),
##D                                               createinDir = TRUE)
##D   
##D StationFolderCreate1
##D 
##D # check if directories were created
##D list.dirs(wd_createStationDir)
##D 
## End(Not run)



