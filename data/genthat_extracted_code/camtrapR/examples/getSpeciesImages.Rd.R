library(camtrapR)


### Name: getSpeciesImages
### Title: Collect all images of a species
### Aliases: getSpeciesImages

### ** Examples

## Not run: 
##D # define image directory
##D wd_images_ID <- system.file("pictures/sample_images", package = "camtrapR")
##D wd_images_ID_copy <- file.path(tempdir(), "sample_species_images")
##D 
##D species_to_copy <- "VTA"    # = Viverra tangalunga, Malay Civet
##D 
##D specImagecopy <- getSpeciesImages(species                 = species_to_copy,
##D                                   inDir                   = wd_images_ID,
##D                                   outDir                  = wd_images_ID_copy,
##D                                   createStationSubfolders = FALSE,
##D                                   IDfrom                  = "directory"
##D                                   )
## End(Not run)



