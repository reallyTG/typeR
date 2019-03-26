library(fabricatr)


### Name: split_quantile
### Title: Split data into quantile buckets (e.g. terciles, quartiles,
###   quantiles, deciles).
### Aliases: split_quantile

### ** Examples


# Divide this arbitrary data set in 3.
data_input <- rnorm(n = 100)
split_quantile(x = data_input, type = 3)




