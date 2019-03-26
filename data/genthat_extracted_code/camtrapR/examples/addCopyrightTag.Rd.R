library(camtrapR)


### Name: addCopyrightTag
### Title: Write a copyright tag into JPEG image metadata
### Aliases: addCopyrightTag

### ** Examples


## Not run: 
##D 
##D if (Sys.which("exiftool") != ""){        # only run this example if ExifTool is available
##D 
##D # copy sample images to temporary directory (so we don't mess around in the package directory)
##D wd_images_ID <- system.file(file.path("pictures", "sample_images"), package = "camtrapR")
##D file.copy(from = wd_images_ID, to = tempdir(), recursive = TRUE)
##D wd_images_ID_copy <- file.path(tempdir(), "sample_images")
##D 
##D # define a sample tag
##D copyrightTagToAdd <- "Your Name (Your Organisation)"
##D 
##D # add the tag to the images
##D addCopyrightTag(inDir        = wd_images_ID_copy, 
##D                 copyrightTag = copyrightTagToAdd)
##D 1     # we choose "YES", i.e., we want to add a copyright tag
##D                 
##D # you can check the outcome with function exifTagNames (find the field "Copyright")
##D 
##D exifTagNames(wd_images_ID_copy, returnMetadata = TRUE)
##D }
##D 
##D 
## End(Not run)



