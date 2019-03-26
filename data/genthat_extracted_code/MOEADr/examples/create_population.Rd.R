library(MOEADr)


### Name: create_population
### Title: Create population
### Aliases: create_population

### ** Examples

ex.problem <- list(name = "example_problem",
                   xmin = rep(-1, 5),
                   xmax = rep(1, 5),
                   m    = 2)
X <- create_population(20, ex.problem)




