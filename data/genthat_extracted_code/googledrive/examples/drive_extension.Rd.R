library(googledrive)


### Name: drive_extension
### Title: Lookup extension from MIME type
### Aliases: drive_extension

### ** Examples


## get the extension for mime type image/jpeg
drive_extension("image/jpeg")

## it's vectorized
drive_extension(c("text/plain", "pdf", "image/gif"))



