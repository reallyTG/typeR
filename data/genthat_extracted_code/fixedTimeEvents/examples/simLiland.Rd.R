library(fixedTimeEvents)


### Name: simLiland
### Title: Simulations for the Liland distribution.
### Aliases: simLiland simLiland2 simLilandMu

### ** Examples

simLiland(1000,20,10)
sl <- simLiland2(1000,20,10)
sl$counts[sl$ms]/1000
plot(density(simLilandMu(1000,20,10)))



