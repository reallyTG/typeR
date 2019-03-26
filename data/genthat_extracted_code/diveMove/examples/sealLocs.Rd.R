library(diveMove)


### Name: sealLocs
### Title: Ringed and Gray Seal ARGOS Satellite Location Data
### Aliases: sealLocs
### Keywords: datasets

### ** Examples


zz <- system.file(file.path("data", "sealLocs.csv"),
                  package="diveMove", mustWork=TRUE)
str(read.csv(zz, sep=";"))




