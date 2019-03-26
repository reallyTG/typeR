library(circlize)


### Name: read.cytoband
### Title: Read/parse cytoband data from a data frame/file/UCSC database
### Aliases: read.cytoband

### ** Examples

data = read.cytoband(species = "hg19")
data = read.cytoband(cytoband = system.file(package = "circlize", "extdata", "cytoBand.txt"))
cytoband = read.table(system.file(package = "circlize", "extdata", "cytoBand.txt"), 
    colClasses = c("character", "numeric", "numeric", "character", "character"), sep = "\t")
data = read.cytoband(cytoband = cytoband)



