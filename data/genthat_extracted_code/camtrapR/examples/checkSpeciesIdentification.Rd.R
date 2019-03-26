library(camtrapR)


### Name: checkSpeciesIdentification
### Title: Consistency check on species image identification
### Aliases: checkSpeciesIdentification

### ** Examples


wd_images_ID <- system.file("pictures/sample_images", package = "camtrapR")

if (Sys.which("exiftool") != ""){        # only run this example if ExifTool is available
check.folders <- checkSpeciesIdentification(inDir             = wd_images_ID,
                                            IDfrom            = "directory",
                                            hasCameraFolders  = FALSE,
                                            maxDeltaTime      = 120,
                                            writecsv          = FALSE)
                                     
check.folders   # In the example, 2 different species were photographed within 2 minutes. 
}

## Not run: 
##D # now exclude one of these 2 species 
##D check.folders2 <- checkSpeciesIdentification(inDir             = wd_images_ID,
##D                                              IDfrom            = "directory",
##D                                              hasCameraFolders  = FALSE,
##D                                              maxDeltaTime      = 120,
##D                                              excludeSpecies    = "EGY",
##D                                              writecsv          = FALSE)           
##D   
##D check.folders2   # the data frame is empty
##D 
##D # now we check only one station
##D check.folders3 <- checkSpeciesIdentification(inDir             = wd_images_ID,
##D                                              IDfrom            = "directory",
##D                                              hasCameraFolders  = FALSE,
##D                                              maxDeltaTime      = 120,
##D                                              stationsToCheck   = "StationB",
##D                                              writecsv          = FALSE)
##D check.folders3   # the data frame is empty
## End(Not run)




