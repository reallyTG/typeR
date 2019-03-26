library(MALDIquantForeign)


### Name: importCdf
### Title: Import CDF files
### Aliases: importCdf

### ** Examples


library("MALDIquant")
library("MALDIquantForeign")

## get example directory
exampleDirectory <- system.file("exampledata", package="MALDIquantForeign")

## import
if (requireNamespace("RNetCDF", quietly=TRUE)) {
  s <- importCdf(exampleDirectory)
} else {
  message("You have to install the RNetCDF package to use importCdf.")
}




