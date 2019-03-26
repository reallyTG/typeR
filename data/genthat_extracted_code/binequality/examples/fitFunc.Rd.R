library(binequality)


### Name: fitFunc
### Title: A function to fit a parametric distribution to binned data.
### Aliases: fitFunc

### ** Examples

data(state_bins)

use_states <- which(state_bins[,'State'] == 'Texas' | state_bins[,'State'] == 'California')

ID <- state_bins[use_states,'State']
hb <- state_bins[use_states,'hb']
bmin <- state_bins[use_states,'bin_min']
bmax <- state_bins[use_states,'bin_max']
omu <- rep(NA, length(use_states))
fitFunc(ID = ID, hb = hb, bin_min = bmin, bin_max = bmax, obs_mean = omu, ID_name = 'State')



