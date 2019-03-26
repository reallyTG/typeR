library(prevtoinc)


### Name: simulate_incidence_stats_fast
### Title: Function to calculate theoretical value for x.loi and I
### Aliases: simulate_incidence_stats_fast

### ** Examples

example.dist <- create_dist_vec(function(x) dpois(x-1, 7), 70)
data.fast.inc.theo <- simulate_incidence_stats_fast(P=0.05, dist.X.loi = example.dist)
data.fast.inc.theo$x.loi
data.fast.inc.theo$I



