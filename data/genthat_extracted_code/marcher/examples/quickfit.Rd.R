library(marcher)


### Name: quickfit
### Title: Quick fit of one-step migration
### Aliases: quickfit

### ** Examples

require(marcher)

## Load simulated data
data(SimulatedTracks)

# plot the MOU simulation
scan_track(MOU.sim)

# quick fit - setting dt = 10
(pm.0 <- with(MOU.sim, quickfit(T, X, Y, dt = 10)))

# interactive locator process
if(interactive()){
 (with(MOU.sim, locate_shift(T, X, Y)))
}

# fit the model
fit <- with(MOU.sim, estimate_shift(T, X, Y))

## Three cluster example

# plot the three range shift simulation
scan_track(MOU.3range)

# quick fit 
## (note - this may not always work!)
with(MOU.3range, quickfit(T, X, Y, dt = 10, n.clust = 3))

if(interactive()){
  with(MOU.3range, locate_shift(T, X, Y, n.clust = 3))
}



