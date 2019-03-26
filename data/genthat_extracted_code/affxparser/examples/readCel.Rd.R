library(affxparser)


### Name: readCel
### Title: Reads an Affymetrix CEL file
### Aliases: readCel
### Keywords: file IO

### ** Examples

  for (zzz in 0) {  # Only so that 'break' can be used

  # Scan current directory for CEL files
  celFiles <- list.files(pattern="[.](c|C)(e|E)(l|L)$")
  if (length(celFiles) == 0)
    break;

  celFile <- celFiles[1]

  # Read a subset of cells
  idxs <- c(1:5, 1250:1500, 450:440)
  cel <- readCel(celFile, indices=idxs, readOutliers=TRUE)
  str(cel)

  # Clean up
  rm(celFiles, celFile, cel)

  } # for (zzz in 0)



