library(Dasst)


### Name: gatherTables
### Title: Gather tables of an object of class Dasst.
### Aliases: gatherTables

### ** Examples

data(plantGrowth)
plantgro12 <- gatherTables(plantGrowth[1:10], c("DAP"),
   c("SWAD","LWAD","GWAD"), mean)



