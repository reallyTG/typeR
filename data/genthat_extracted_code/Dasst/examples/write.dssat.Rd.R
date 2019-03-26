library(Dasst)


### Name: write.dssat
### Title: Write to a DSSAT-style file from an object of class Dasst
### Aliases: write.dssat

### ** Examples

data(plantGrowth)
length(plantGrowth) <- 1
ffn <- paste(tempdir(), "PlantGro.OUT", sep="/")
write.dssat(plantGrowth, ffn)



