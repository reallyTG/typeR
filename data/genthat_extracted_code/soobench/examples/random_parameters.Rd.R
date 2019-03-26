library(soobench)


### Name: random_parameters
### Title: Generate random parameters for a given function. Given a test
###   function 'fn', generate 'n' random parameter settings for that
###   function.
### Aliases: random_parameters

### ** Examples

fn <- ackley_function(10)
X <- random_parameters(100, fn)
str(X)
y <- fn(X)



