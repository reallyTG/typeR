library(prevtoinc)


### Name: generate_I_fast
### Title: Function to simulate PPS and data and calculate a number of
###   estimators
### Aliases: generate_I_fast

### ** Examples

example.dist <- create_dist_vec(function(x) dpois(x-1, 7), max.dist = 70)
generate_I_fast(200, P = 0.05, example.dist )




