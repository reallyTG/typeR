library(binequality)


### Name: midStats
### Title: A function to calculate statistics using bin midpoints
### Aliases: midStats

### ** Examples

data(state_bins)

bin_mids <- getMids(ID = state_bins[,'State'], hb = 
state_bins[,'hb'], lb = state_bins[,'bin_min'], ub = 
state_bins[,'bin_max'], alpha_bound = 10/9)

state_bin_mid_stats <- midStats(data = bin_mids$mids)



