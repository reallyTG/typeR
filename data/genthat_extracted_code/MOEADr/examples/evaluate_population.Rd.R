library(MOEADr)


### Name: evaluate_population
### Title: Evaluate population
### Aliases: evaluate_population

### ** Examples

ex.problem <- list(name = "example_problem",
                   xmin = rep(-1, 5),
                   xmax = rep(1, 5),
                   m    = 2)
X <- create_population(20, ex.problem)
Y <- evaluate_population(X, ex.problem, nfe = 0)




