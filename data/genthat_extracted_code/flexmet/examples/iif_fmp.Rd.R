library(flexmet)


### Name: iif_fmp
### Title: FMP Item Information Function
### Aliases: iif_fmp

### ** Examples


# plot the IIF for an item with k = 2

set.seed(2342)
bmat <- sim_bmat(n_items = 1, k = 2)$bmat

theta <- seq(-3, 3, by = .01)

information <- iif_fmp(theta = theta, bmat = bmat)

plot(theta, information, type = 'l')




