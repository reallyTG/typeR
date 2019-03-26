library(binequality)


### Name: getMids
### Title: A function to calculate the bin midpoints.
### Aliases: getMids

### ** Examples

data(state_bins)

bin_mids <- getMids(ID = state_bins[,'State'], hb = 
state_bins[,'hb'], lb = state_bins[,'bin_min'], ub = 
state_bins[,'bin_max'], alpha_bound = 10/9)

bin_mids_unbound <- getMids(ID = state_bins[,'State'], hb = 
state_bins[,'hb'], lb = state_bins[,'bin_min'], ub = 
state_bins[,'bin_max'], alpha_bound = numeric(0))



