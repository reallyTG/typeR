library(ELISAtools)


### Name: plotAlignData
### Title: Plot all batch data together
### Aliases: plotAlignData

### ** Examples

#load the library
library(ELISAtools)

#get file folder
dir_file<-system.file("extdata", package="ELISAtools")

#load the data
batches<-loadData(file.path(dir_file,"design.txt"))

#plot the raw batch data together
plotAlignData(batches);





