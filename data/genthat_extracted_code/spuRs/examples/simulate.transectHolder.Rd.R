library(spuRs)


### Name: simulate.transectHolder
### Title: Function to simulate a modelled seed rain from a transectHolder
### Aliases: simulate.transectHolder
### Keywords: distribution

### ** Examples

transect.1 <- trapTransect(distances = 1:4,
                        seed.counts = c(4, 3, 2, 0))
transect.2 <- trapTransect(distances = 1:3,
                        seed.counts = c(3, 2, 1))
transect.3 <- trapTransect(distances=(1:5)/2,
                        seed.counts = c(3, 4, 2, 3, 1))
allTraps <- transectHolder(transect.1, transect.2, transect.3,
                           family="Weibull")
allTraps
simulate(allTraps, nsim=5, seed=123)



