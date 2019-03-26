library(abn)


### Name: discretization
### Title: Discretization of a Possibly Continuous Data Frame of Random
###   Variables based on their distribution
### Aliases: discretization

### ** Examples

## Generate random variable
rv <- rnorm(n = 100, mean = 5, sd = 2)
dist <- list("gaussian")
names(dist) <- c("rv")

## Compute the entropy through discretization
entropyData(freqs.table = discretization(data.df = rv,
data.dists = dist,
discretization.method = "sturges",
nb.states = FALSE))



