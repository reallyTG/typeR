library(exiftoolr)


### Name: exif_call
### Title: Call ExifTool from R
### Aliases: exif_call exif_version

### ** Examples

## Not run: 
##D 
##D ## Find local ExifTool version using exif_version() or exif_call()
##D exif_version()
##D exif_call(args = "-ver", intern = TRUE, quiet = quiet)
##D 
##D ## Make a temporary copy of a jpeg file
##D temp <- tempfile()
##D file.copy(system.file(package = "exiftoolr", "images", "LaSals.jpg"),
##D           temp)
##D 
##D ## Both of the following extract the same tags:
##D exif_read(files, tags = c("filename", "imagesize"))
##D exif_call(args = c("-n", "-j", "-q", "-filename", "-imagesize"),
##D           path = temp)
##D 
##D ## Set value of a new "Artist" field in photo's metadata
##D exif_read(temp, tags = "artist")
##D exif_call(path = temp, args = "-Artist=me")
##D exif_read(temp, tags = "artist")
##D 
##D ## Remove all but a few essential fields
##D length(exif_read(temp))
##D exif_call(path = temp, args = "-all=")
##D length(exif_read(temp))
##D exif_read(temp)
##D 
##D unlink(temp)
## End(Not run)



