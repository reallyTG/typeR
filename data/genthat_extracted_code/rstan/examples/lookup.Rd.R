library(rstan)


### Name: lookup
### Title: Look up the Stan function that corresponds to a R function or
###   name.
### Aliases: lookup

### ** Examples

lookup(dnorm)      # Stan equivalents for the normal PDF (in log form)
lookup("foo")      # fails
lookup("Student")  # succeeds even though there is no such R function
lookup("^poisson") # every Stan function that starts with poisson



