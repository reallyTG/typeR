library(DDD)


### Name: L2brts
### Title: Function to convert a table with speciation and extinction
###   events to a set of branching times
### Aliases: L2brts
### Keywords: models

### ** Examples

sim = dd_sim(c(0.2,0.1,20),10)
phy = L2brts(sim$L)
plot(phy)



