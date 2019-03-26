library(rnaseqWrapper)


### Name: parseVarScan
### Title: Parse a VarScan output
### Aliases: parseVarScan

### ** Examples


## Get example data
## This could be just read in using read.table for your data
data(varScanExample)

parseTest <- parseVarScan(varScanExample,
                          sampleNames=LETTERS[1:10])

head(parseTest)






