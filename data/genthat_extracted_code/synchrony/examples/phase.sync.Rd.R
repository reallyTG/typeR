library(synchrony)


### Name: phase.sync
### Title: Phase synchrony of quasi-periodic time series
### Aliases: phase.sync

### ** Examples

t1=runif(100)
t2=runif(100)
# Compute and interpolate phases using successive local minima
sync.mins=phase.sync(t1, t2, mins=TRUE)
# Compute and interpolate phases using successive local maxima
sync.maxs=phase.sync(t1, t2)
# Plot distribution of phase difference
hist(sync.mins$deltaphase$mod_phase_diff_2pi)



