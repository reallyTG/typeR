library(hint)


### Name: overlay.sim
### Title: Overlay Simulation Results on Distribution
### Aliases: overlay.sim

### ** Examples

## Generate exact distribution and plot:
dd <- dhint(108, c(54,76,89))
plot(dd[,1], dd[,2], col="blue")
## Simulate drawing from 3 urns (sims should be larger).
nn <- sim.hydist(108, c(54,76,89), sims = 10)
## Add data to existing distribution plot:
overlay.sim(nn, breaks = 0:54)



