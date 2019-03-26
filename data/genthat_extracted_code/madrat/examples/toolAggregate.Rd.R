library(madrat)


### Name: toolAggregate
### Title: toolAggregate
### Aliases: toolAggregate

### ** Examples


# create example mapping
mapping <- data.frame(from=getRegions(population_magpie),to=rep(c("REG1","REG2"),5))
mapping 

# run aggregation
toolAggregate(population_magpie,mapping)
# weighted aggregation
toolAggregate(population_magpie,mapping, weight=population_magpie)



