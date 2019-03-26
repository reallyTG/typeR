library(secr)


### Name: autoini
### Title: Initial Parameter Values for SECR
### Aliases: autoini
### Keywords: models

### ** Examples

demotraps <- make.grid()
demomask <- make.mask(demotraps)
demoCH <- sim.capthist (demotraps, popn = list(D = 5, buffer = 100), seed = 321)
autoini (demoCH, demomask)



