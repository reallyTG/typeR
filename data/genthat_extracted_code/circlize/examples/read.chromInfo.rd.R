library(circlize)


### Name: read.chromInfo
### Title: Read/parse chromInfo data from a data frame/file/UCSC database
### Aliases: read.chromInfo

### ** Examples

data = read.chromInfo(species = "hg19")
data = read.chromInfo(chromInfo = system.file(package = "circlize", "extdata", "chromInfo.txt"))
chromInfo = read.table(system.file(package = "circlize", "extdata", "chromInfo.txt"), 
    colClasses = c("character", "numeric"), sep = "\t")
data = read.chromInfo(chromInfo = chromInfo)



