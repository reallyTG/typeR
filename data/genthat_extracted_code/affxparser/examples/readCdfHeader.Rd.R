library(affxparser)


### Name: readCdfHeader
### Title: Reads the header associated with an Affymetrix CDF file
### Aliases: readCdfHeader
### Keywords: file IO

### ** Examples

for (zzz in 0) {

# Find any CDF file
cdfFile <- findCdf()
if (is.null(cdfFile))
  break

header <- readCdfHeader(cdfFile)
print(header)

} # for (zzz in 0)



