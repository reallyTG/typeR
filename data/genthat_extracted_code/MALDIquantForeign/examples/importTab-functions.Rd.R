library(MALDIquantForeign)


### Name: importTxt
### Title: Import text files
### Aliases: importTxt importTab importCsv

### ** Examples


library("MALDIquant")
library("MALDIquantForeign")

## get example directory
exampleDirectory <- system.file("exampledata", package="MALDIquantForeign")

## import txt files
s <- importTxt(exampleDirectory)

## import csv files
s <- importCsv(exampleDirectory)




