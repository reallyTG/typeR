library(flexmet)


### Name: get_surrogates
### Title: Find Theta Surrogates
### Aliases: get_surrogates

### ** Examples


set.seed(2342)
bmat <- sim_bmat(n_items = 5, k = 2)$bmat

theta <- rnorm(50)
dat <- sim_data(bmat = bmat, theta = theta)

tsur <- get_surrogates(dat)




