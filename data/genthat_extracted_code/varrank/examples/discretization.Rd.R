library(varrank)


### Name: discretization
### Title: Discretization of a Possibly Continuous Data Frame of Random
###   Variables
### Aliases: discretization

### ** Examples

rv <- rnorm(n = 100, mean = 0, sd = 2)

entropy.data(freqs.table = discretization(data.df = rv,
discretization.method = "fd",
frequency=TRUE)[[1]])




