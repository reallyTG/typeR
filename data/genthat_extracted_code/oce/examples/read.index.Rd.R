library(oce)


### Name: read.index
### Title: Read a NOAA ocean index file
### Aliases: read.index

### ** Examples


## Not run: 
##D library(oce)
##D par(mfrow=c(2, 1))
##D # 1. AO, Arctic oscillation
##D ao <- read.index("https://www.esrl.noaa.gov/psd/data/correlation/ao.data")
##D aorecent <- subset(ao, t > as.POSIXct("2000-01-01"))
##D oce.plot.ts(aorecent$t, aorecent$index)
##D # 2. SOI, probably more up-to-date then data(soi, package="ocedata")
##D soi <- read.index("https://www.cgd.ucar.edu/cas/catalog/climind/SOI.signal.ascii")
##D soirecent <- subset(soi, t > as.POSIXct("2000-01-01"))
##D oce.plot.ts(soirecent$t, soirecent$index)
## End(Not run)



