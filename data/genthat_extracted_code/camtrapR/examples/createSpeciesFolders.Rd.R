library(camtrapR)


### Name: createSpeciesFolders
### Title: Create species directories for species identification
### Aliases: createSpeciesFolders

### ** Examples

## Not run: 
##D 
##D # create dummy directories for tests
##D # (normally, you'd use directory containing renamed, unsorted images)
##D 
##D # this will be used as inDir
##D wd_createDirTest <- file.path(getwd(), "createSpeciesFoldersTest")
##D 
##D # now we create 2 station subdirectories
##D dirs_to_create <- file.path(wd_createDirTest, c("StationA", "StationB"))
##D sapply(dirs_to_create, FUN = dir.create, recursive = TRUE)
##D 
##D # species names for which we want to create subdirectories
##D species <- c("Sambar Deer", "Bay Cat")
##D 
##D # create species subdirectories
##D SpecFolderCreate1 <- createSpeciesFolders (inDir               = wd_createDirTest,
##D                                            species             = species,
##D                                            hasCameraFolders = FALSE,
##D                                            removeFolders       = FALSE)
##D   
##D SpecFolderCreate1
##D 
##D # check if directories were created
##D list.dirs(wd_createDirTest)
##D 
##D # delete empty species directories
##D SpecFolderCreate2 <- createSpeciesFolders (inDir               = wd_createDirTest,
##D                                            species             = species,
##D                                            hasCameraFolders = FALSE,
##D                                            removeFolders       = TRUE)
##D 
##D SpecFolderCreate2
##D 
##D # check if species directories were deleted
##D list.dirs(wd_createDirTest)
##D 
## End(Not run)



