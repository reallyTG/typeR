library(MALDIquantForeign)


### Name: import
### Title: Import files
### Aliases: import

### ** Examples


library("MALDIquant")
library("MALDIquantForeign")

## get example directory
exampleDirectory <- system.file("exampledata", package="MALDIquantForeign")

## import mzXML files
s <- import(exampleDirectory, type="mzXML")

## import tab delimited file with different file extension (default: *.tab)
s <- import(exampleDirectory, type="tab", pattern="^.*\\.txt")

## import single mzML file
s <- import(file.path(exampleDirectory, "tiny1.mzML1.1.mzML"))

## import gzipped csv file
s <- import(file.path(exampleDirectory, "compressed", "csv1.csv.gz"))




