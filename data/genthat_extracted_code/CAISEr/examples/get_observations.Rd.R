library(CAISEr)


### Name: get_observations
### Title: Run an algorithm on a problem.
### Aliases: get_observations

### ** Examples

algorithm <- list(FUN = "dummyalgo", alias = "myalgo",
                  distribution.fun = "rnorm",
                  distribution.pars = list(mean = 50, sd = 10))
instance <- list(FUN = "dummyinstance")
x <- get_observations(algorithm, instance, n = 1000)
hist(x)



