library(pheno2geno)


### Name: add.to.population
### Title: Add additional data to a population object
### Aliases: add.to.population add.to.populationSub.internal dataObject
###   dataType
### Keywords: manip

### ** Examples

  population <- fake.population()
  offspring <- population$offspring$phenotypes
  founders <- population$founders$phenotypes
  founders_groups <- population$founders$groups
  maps_genetic <- population$maps$genetic
  population <- create.population(offspring,founders,founders_groups)
  population <- add.to.population(population,maps_genetic,"maps$genetic")



