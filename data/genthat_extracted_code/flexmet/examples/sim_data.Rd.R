library(flexmet)


### Name: sim_data
### Title: Simulate FMP Data
### Aliases: sim_data

### ** Examples


## generate binary item responses for normally distributed theta
##   and 5 items with k = 2

set.seed(2342)
bmat <- sim_bmat(n_items = 5, k = 2)$bmat

theta <- rnorm(50)
dat <- sim_data(bmat = bmat, theta = theta)




