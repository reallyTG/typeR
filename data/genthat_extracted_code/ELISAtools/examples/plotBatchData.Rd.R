library(ELISAtools)


### Name: plotBatchData
### Title: Plot ELISA data for one batch
### Aliases: plotBatchData

### ** Examples

#load the library
library(ELISAtools)

#get file folder
dir_file<-system.file("extdata", package="ELISAtools")

#load the data
batches<-loadData(file.path(dir_file,"design.txt"))

#plot the raw batch 1 data
plotBatchData(batches[[1]]);





