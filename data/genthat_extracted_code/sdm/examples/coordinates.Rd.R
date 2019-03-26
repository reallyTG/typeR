library(sdm)


### Name: coordinates
### Title: get or set spatial coordinates of species data
### Aliases: coordinates coordinates<- coordinates,sdmdata-method
###   coordinates,sdmModels-method coordinates<-,sdmdata-method
### Keywords: spatial

### ** Examples

file <- system.file("external/data.sdd", package="sdm")
d <- read.sdm(file)

d # a sdmdata object

coordinates(d)




