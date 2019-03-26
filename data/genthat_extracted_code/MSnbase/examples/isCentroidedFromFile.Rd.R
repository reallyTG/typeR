library(MSnbase)


### Name: isCentroidedFromFile
### Title: Get mode from mzML data file
### Aliases: isCentroidedFromFile

### ** Examples

library("msdata")
f <- proteomics(full.names = TRUE,
                pattern = "TMT_Erwinia_1uLSike_Top10HCD_isol2_45stepped_60min_01.mzML.gz")
x <- readMSData(f, mode = "onDisk")
table(isCentroidedFromFile(x), msLevel(x))



