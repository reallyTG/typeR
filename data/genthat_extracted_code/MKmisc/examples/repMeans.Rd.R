library(MKmisc)


### Name: repMeans
### Title: Compute mean of replicated spots
### Aliases: repMeans
### Keywords: univar

### ** Examples

## only a dummy example
M <- matrix(rnorm(1000), ncol = 10)
FL <- matrix(rpois(1000, lambda = 10), ncol = 10) # only for this example
res <- repMeans(x = M, flags = FL, use.flags = "max", ndups = 5, spacing = 20)



