library(BAT)


### Name: sim.sad
### Title: Simulation of species abundance distributions (SAD).
### Aliases: sim.sad

### ** Examples

comm1 <- sim.sad(10000, 100)
comm2 <- sim.sad(10000, 100, sd = 2)
comm3 <- sim.sad(10000, 100, sad = "uniform")
par(mfrow=c(1,3))
hist(log(comm1$Freq))
hist(log(comm2$Freq))
hist(log(comm3$Freq))



