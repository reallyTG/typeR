library(magclass)


### Name: lin.convergence
### Title: lin.convergence
### Aliases: lin.convergence

### ** Examples


data(population_magpie)
population <- add_columns(population_magpie,"MIX")
population[,,"MIX"] <- lin.convergence(population[,,"A2"],population[,,"B1"],
                                       convergence_time_steps=10)




