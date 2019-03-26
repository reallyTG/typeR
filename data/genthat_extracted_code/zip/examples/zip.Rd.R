library(zip)


### Name: zip
### Title: Compress Files into 'zip' Archives
### Aliases: zip zipr zip_append zipr_append

### ** Examples

## Some files to zip up
dir.create(tmp <- tempfile())
cat("first file", file = file.path(tmp, "file1"))
cat("second file", file = file.path(tmp, "file2"))

zipfile <- tempfile(fileext = ".zip")
zipr(zipfile, tmp)

## List contents
zip_list(zipfile)

## Add another file
cat("third file", file = file.path(tmp, "file3"))
zipr_append(zipfile, file.path(tmp, "file3"))
zip_list(zipfile)



