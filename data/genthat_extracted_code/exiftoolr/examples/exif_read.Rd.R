library(exiftoolr)


### Name: exif_read
### Title: Read EXIF and other metadata from files
### Aliases: exif_read

### ** Examples

## Not run: 
##D files <- dir(system.file(package = "exiftoolr", "images"),
##D                   pattern = "*.jpg", full.names = TRUE)
##D exifinfo <- exif_read(files)
##D exif_read(files, tags = c("filename", "imagesize"))
## End(Not run)



