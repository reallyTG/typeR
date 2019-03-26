library(affxparser)


### Name: readCelHeader
### Title: Parsing the header of an Affymetrix CEL file
### Aliases: readCelHeader
### Keywords: file IO

### ** Examples

  # Scan current directory for CEL files
  files <- list.files(pattern="[.](c|C)(e|E)(l|L)$")
  if (length(files) > 0) {
    header <- readCelHeader(files[1])
    print(header)
    rm(header)
  }

  # Clean up
  rm(files)



