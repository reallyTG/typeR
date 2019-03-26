library(binequality)


### Name: run_GB_family
### Title: A function to fit a parametric distributions to binned data.
### Aliases: run_GB_family

### ** Examples

data(state_bins)

use_states <- which(state_bins[,'State'] == 'Texas')
TX <- state_bins[use_states,]

LNO_WEI_GA <- run_GB_family(ID = TX[,'State'], hb = TX[,'hb'], 
bin_min = TX[,'bin_min'], bin_max = TX[,'bin_max'], obs_mean = 
rep(NA, length(use_states)), ID_name = "State", quantiles = 
seq(0.006,0.996, length.out = 1000), modelsToFit = 
c('LOGNO','WEI','GA'))




