library(prevtoinc)


### Name: simulate_pps_fast
### Title: Faster method to generate data for PPS with only length of
###   nosocomial infections as output
### Aliases: simulate_pps_fast

### ** Examples

example.dist <- create_dist_vec(function(x) dpois(x-1, 7), 70)
data.pps.fast <- simulate_pps_fast(n.sample=5000,
                                  P=0.05,
                                  dist.X.loi = example.dist)
head(data.pps.fast)



