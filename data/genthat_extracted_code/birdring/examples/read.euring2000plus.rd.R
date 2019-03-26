library(birdring)


### Name: read.euring2000plus
### Title: Reads EURING data of the format 2000\+ into R
### Aliases: read.euring2000plus
### Keywords: data manip

### ** Examples

filename <- system.file("extdata", "REEWAExport_50.psv", package = "birdring")
dat <-  read.euring2000plus(filename)
str(dat)



