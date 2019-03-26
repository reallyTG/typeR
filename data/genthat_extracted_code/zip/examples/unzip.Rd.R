library(zip)


### Name: unzip
### Title: Uncompress 'zip' Archives
### Aliases: unzip

### ** Examples

## Some files to zip up
dir.create(tmp <- tempfile())
cat("first file", file = file.path(tmp, "file1"))
cat("second file", file = file.path(tmp, "file2"))

zipfile <- tempfile(fileext = ".zip")
zipr(zipfile, tmp)

## List contents
zip_list(zipfile)

## Extract
tmp2 <- tempfile()
unzip(zipfile, exdir = tmp2)



