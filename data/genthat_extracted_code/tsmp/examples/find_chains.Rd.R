library(tsmp)


### Name: find_chains
### Title: Find Time Series Chains
### Aliases: find_chains

### ** Examples

w <- 50
data <- mp_gait_data
mp <- tsmp(data, window_size = w, exclusion_zone = 1/4, verbose = 0)
mp <- find_chains(mp)




