library(CIFsmry)


### Name: sim.dat
### Title: Simulated competing risk data
### Aliases: sim.dat
### Keywords: datasets

### ** Examples

data(sim.dat)
names(sim.dat)
table(sim.dat$cause)
table(sim.dat$group)
tapply(sim.dat$time,sim.dat$group,summary)



