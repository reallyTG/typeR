library(flexmet)


### Name: irf_fmp
### Title: FMP Item Response Function
### Aliases: irf_fmp

### ** Examples


# plot the IRF for an item with k = 2

set.seed(2342)
bmat <- sim_bmat(n_items = 1, k = 2)$bmat

theta <- seq(-3, 3, by = .01)

probability <- irf_fmp(theta = theta, bmat = bmat)

plot(theta, probability, type = 'l')




