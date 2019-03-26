library(provenance)


### Name: SH.diss
### Title: Sircombe and Hazelton distance
### Aliases: SH.diss

### ** Examples

datfile <- system.file("DZ.csv",package="provenance")
errfile <- system.file("DZerr.csv",package="provenance")
DZ <- read.distributional(datfile,errfile)
d <- SH.diss(DZ,1,2)
print(d)



