library(LEAP)


### Name: MAC_counter
### Title: Function to perform lag-based correlation anaylsis of
###   single-cell sequencing data, sorted by pseudotime.
### Aliases: MAC_counter max_lag_prop MAC_cutoff file_name
### Keywords: ~kwd1 ~kwd2

### ** Examples


x <- matrix(rnorm(6),2,3)
y <- MAC_counter(x)

## Not run: MAC_results = MAC_counter(data=example_data)



