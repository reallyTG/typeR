library(epiphy)


### Name: smle_wrappers
### Title: Wrappers using maximum likelihood estimation for some
###   distributions
### Aliases: smle_wrappers smle_pois smle_nbinom smle_binom smle_betabinom
### Keywords: internal

### ** Examples

set.seed(12345)
data <- rpois(100, lambda = 5)
res <- smle_pois(data)
res
summary(res)

data <- count(aphids)
res <- smle_pois(data)
res
summary(res)




