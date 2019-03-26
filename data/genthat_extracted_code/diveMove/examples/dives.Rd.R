library(diveMove)


### Name: dives
### Title: Sample of TDR data from a fur seal
### Aliases: dives divesTDR
### Keywords: datasets

### ** Examples


zz <- system.file(file.path("data", "dives.csv"),
                  package="diveMove", mustWork=TRUE)
str(read.csv(zz, sep=";", na.strings=""))




