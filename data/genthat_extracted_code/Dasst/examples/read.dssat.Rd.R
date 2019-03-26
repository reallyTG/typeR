library(Dasst)


### Name: read.dssat
### Title: Read a DSSAT-style file into an object of class Dasst
### Aliases: read.dssat

### ** Examples

dssatfile <- system.file("extdata","PlantGro.OUT",package="Dasst")
dssatfile
plantgro <- read.dssat(dssatfile)
summary(plantgro)



