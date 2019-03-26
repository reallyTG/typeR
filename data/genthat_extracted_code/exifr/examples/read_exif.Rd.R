library(exifr)


### Name: read_exif
### Title: Read EXIF data from files
### Aliases: read_exif

### ** Examples

files <- list.files(path.package("exifr"), recursive=TRUE, pattern="*.jpg", full.names=TRUE)
exifinfo <- read_exif(files)
# is equivalent to
exifinfo <- read_exif(path.package("exifr"), recursive=TRUE)

read_exif(files, tags=c("filename", "imagesize"))




