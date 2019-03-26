library(mudata2)


### Name: write_mudata
### Title: Read/Write mudata objects
### Aliases: write_mudata read_mudata write_mudata_zip read_mudata_zip
###   write_mudata_dir read_mudata_dir write_mudata_json to_mudata_json
###   read_mudata_json from_mudata_json

### ** Examples

# read/write to directory
outfile <- tempfile(fileext=".mudata")
write_mudata(kentvillegreenwood, outfile)
md <- read_mudata(outfile)
unlink(outfile)

# read/write to zip
outfile <- tempfile(fileext=".zip")
write_mudata(kentvillegreenwood, outfile)
md <- read_mudata(outfile)
unlink(outfile)

# read/write to JSON
outfile <- tempfile(fileext=".json")
write_mudata(kentvillegreenwood, outfile)
md <- read_mudata(outfile)
unlink(outfile)




