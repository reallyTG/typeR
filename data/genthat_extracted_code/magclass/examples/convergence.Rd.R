library(magclass)


### Name: convergence
### Title: convergence
### Aliases: convergence

### ** Examples


data(population_magpie)
population <- add_columns(population_magpie,"MIX")
population[,,"MIX"]<-convergence(population[,,"A2"],population[,,"B1"])





