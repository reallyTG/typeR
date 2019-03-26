library(oce)


### Name: read.oce
### Title: Read an Oceanographic Data File
### Aliases: read.oce

### ** Examples


library(oce)
x <- read.oce(system.file("extdata", "ctd.cnv", package="oce"))
plot(x) # summary with TS and profiles
plotTS(x) # just the TS



