library(camtrapR)


### Name: exifTagNames
### Title: Show Exif metadata tags and tag names from JPEG images
### Aliases: exifTagNames

### ** Examples

if (Sys.which("exiftool") != ""){        # only run this example if ExifTool is available
wd_images_ID <- system.file("pictures/sample_images", package = "camtrapR")

# return tag names only
exifTagNames(inDir          = wd_images_ID,
             returnMetadata = FALSE)

# return tag names and metadata
exifTagNames(inDir          = wd_images_ID,
             returnMetadata = TRUE)
}



