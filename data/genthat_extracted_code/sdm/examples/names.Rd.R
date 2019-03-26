library(sdm)


### Name: names
### Title: Names of species
### Aliases: names names<- names,sdmdata-method names<-,sdmdata-method
### Keywords: spatial

### ** Examples

file <- system.file("external/data.sdd", package="sdm")

d <- read.sdm(file)

d

names(d) # returns the names of species



