library(Dasst)


### Name: stackTables
### Title: Stack the tables of an object of class Dasst
### Aliases: stackTables

### ** Examples

data(plantGrowth)
nrow(plantGrowth[[1]])
nrow(plantGrowth[[2]])
plantgro12 <- stackTables(plantGrowth[1:2])
nrow(plantgro12)



