library(camtrapR)


### Name: imageRename
### Title: Copy and rename images based on camera trap station ID and
###   creation date
### Aliases: imageRename

### ** Examples


### "trial" run. create a table with file names after renaming, but don't copy images.

# first, find sample image directory in package directory:
wd_images_raw <- system.file("pictures/raw_images", package = "camtrapR")

if (Sys.which("exiftool") != ""){        # only run this example if ExifTool is available

# because copyImages = FALSE, outDir does not need to be defined
renaming.table <- imageRename(inDir               = wd_images_raw,     
                              hasCameraFolders = FALSE,
                              copyImages          = FALSE,
                              writecsv            = FALSE
  )
  } else {
  message("ExifTool is not available. Cannot test function")
  }
  
  ## Not run: 
##D   
##D   # define image directories
##D 
##D   # raw image location
##D wd_images_raw <- system.file("pictures/raw_images", package = "camtrapR")      
##D   # destination for renamed images
##D wd_images_raw_renamed <- file.path(tempdir(), "raw_images_renamed")       
##D 
##D 
##D   if (Sys.which("exiftool") != ""){        # only run this example if ExifTool is available
##D   
##D   # now we have to set outDir because copyImages = TRUE
##D renaming.table2 <- imageRename(inDir               = wd_images_raw,
##D                                outDir              = wd_images_raw_renamed,       
##D                                hasCameraFolders    = FALSE,
##D                                copyImages          = TRUE,
##D                                writecsv            = FALSE
##D   )
##D   }
##D   
##D   list.files(wd_images_raw_renamed, recursive = TRUE)
##D   
##D   
## End(Not run)



