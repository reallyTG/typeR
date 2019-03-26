library(DEploid)


### Name: extractCoverageFromTxt
### Title: Extract read counts from plain text file
### Aliases: extractCoverageFromTxt

### ** Examples

refFile = system.file("extdata", "PG0390-C.test.ref", package = "DEploid")
altFile = system.file("extdata", "PG0390-C.test.alt", package = "DEploid")
PG0390 = extractCoverageFromTxt(refFile, altFile)




