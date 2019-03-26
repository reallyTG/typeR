library(affxparser)


### Name: readCelIntensities
### Title: Reads the intensities contained in several Affymetrix CEL files
### Aliases: readCelIntensities
### Keywords: file IO

### ** Examples

  # Scan current directory for CEL files
  files <- list.files(pattern="[.](c|C)(e|E)(l|L)$")
  if (length(files) >= 2) {
    cel <- readCelIntensities(files[1:2])
    str(cel)
    rm(cel)
  }

  # Clean up
  rm(files)



