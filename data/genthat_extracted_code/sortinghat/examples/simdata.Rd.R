library(sortinghat)


### Name: simdata
### Title: Wrapper function to generate data from a variety of
###   data-generating families for classification studies.
### Aliases: simdata

### ** Examples

data_normal <- simdata(family = "normal", n = c(10, 20), mean = c(0, 1), cov = diag(2), seed = 42)
data_uniform <- simdata(family = "uniform", delta = 2, seed = 42)
data_friedman <- simdata(family = "friedman", experiment = 4, seed = 42)



