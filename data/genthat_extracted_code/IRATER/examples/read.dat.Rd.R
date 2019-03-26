library(IRATER)


### Name: read.dat
### Title: loads existing IRATE-model setup (incl. tag release & recapture
###   data)
### Aliases: read.dat

### ** Examples

### read a preinstalled IRATE setup example:
examples.folder <- system.file("IRATE.examples", package = "IRATER")
setwd(examples.folder)                       
fnames <- Sys.glob('*.dat')
read.dat(fnames[1])




