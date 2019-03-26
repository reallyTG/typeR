library(simulator)


### Name: new_model
### Title: Create a Model object
### Aliases: new_model

### ** Examples

make_my_example_model <- function(n) {
  new_model(name = "normal-data",
            label = sprintf("Normal (n = %s)", n),
            params = list(n = n, mu = 2),
            simulate = function(n, mu, nsim) {
              # this function must return a list of length nsim
              x <- matrix(rnorm(n * nsim), n, nsim)
              x <- mu + x # true mean is mu
              return(split(x, col(x))) # make each col its own list element
            })
}



