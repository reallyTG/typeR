library(phylotaR)


### Name: calc_mad
### Title: Calculate MAD score
### Aliases: calc_mad

### ** Examples

data("bromeliads")
random_cids <- sample(bromeliads@cids, 10)
(calc_mad(phylota = bromeliads, cid = random_cids))



