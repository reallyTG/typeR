library(googledrive)


### Name: drive_mime_type
### Title: Lookup MIME type
### Aliases: drive_mime_type

### ** Examples

## get the mime type for Google Spreadsheets
drive_mime_type("spreadsheet")

## get the mime type for jpegs
drive_mime_type("jpeg")

## it's vectorized
drive_mime_type(c("presentation", "pdf", "image/gif"))

## see the internal tibble of MIME types known to the Drive API
drive_mime_type(expose())



