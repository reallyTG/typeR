library(PATHChange)


### Name: PATHChange
### Title: Determination of differentially expressed pathways using
###   multi-statistic comparison
### Aliases: PATHChange

### ** Examples

require(rlist)
path<-list.load(system.file("extdata", "path.rds", package = "PATHChange"))[c(1:10)]
MeanData<-list.load(system.file("extdata", "MeanData.rds", package = "PATHChange"))
  
## Not run: PATHChange(path=path, MeanData=MeanData, writeCSV=FALSE, writeRDS=FALSE)
## Not run: p.value <- list.load(file.path(tempdir(),"pValue.rds"))



