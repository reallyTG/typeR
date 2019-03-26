library(IsoplotR)


### Name: data2york
### Title: Prepare geochronological data for York regression
### Aliases: data2york data2york.default data2york.UPb data2york.ArAr
###   data2york.KCa data2york.PbPb data2york.PD data2york.UThHe
###   data2york.ThU

### ** Examples

f <- system.file("RbSr1.csv",package="IsoplotR")
dat <- read.csv(f)
yorkdat <- data2york(dat)
fit <- york(yorkdat)



