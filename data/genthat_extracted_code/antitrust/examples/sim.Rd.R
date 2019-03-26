library(antitrust)


### Name: sim
### Title: Merger Simulation With User-Supplied Demand Parameters
### Aliases: sim

### ** Examples


## Calibration and simulation results from a merger between Budweiser and
## Old Style. Note that the in the following model there is no outside
## good; BUD's mean value has been normalized to zero.

## Source: Epstein/Rubenfeld 2004, pg 80


prodNames <- c("BUD","OLD STYLE","MILLER","MILLER-LITE","OTHER-LITE","OTHER-REG")
ownerPre <-c("BUD","OLD STYLE","MILLER","MILLER","OTHER-LITE","OTHER-REG")
ownerPost <-c("BUD","BUD","MILLER","MILLER","OTHER-LITE","OTHER-REG")
nests <- c("Reg","Reg","Reg","Light","Light","Reg")

price    <- c(.0441,.0328,.0409,.0396,.0387,.0497)

demand.param=list(alpha=-48.0457,
                 meanval=c(0,0.4149233,1.1899885,0.8252482,0.1460183,1.4865730)
                )

sim.logit <- sim(price,demand="Logit",demand.param,ownerPre=ownerPre,ownerPost=ownerPost)



print(sim.logit)           # return predicted price change
summary(sim.logit)         # summarize merger simulation

elast(sim.logit,TRUE)      # returns premerger elasticities
elast(sim.logit,FALSE)     # returns postmerger elasticities

diversion(sim.logit,TRUE)  # return premerger diversion ratios
diversion(sim.logit,FALSE) # return postmerger diversion ratios


cmcr(sim.logit)            #calculate compensating marginal cost reduction
upp(sim.logit)             #calculate Upwards Pricing Pressure Index

CV(sim.logit)              #calculate representative agent compensating variation





