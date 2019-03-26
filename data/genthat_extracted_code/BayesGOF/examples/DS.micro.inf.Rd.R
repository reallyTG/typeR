library(BayesGOF)


### Name: DS.micro.inf
### Title: MicroInference for DS Prior Objects
### Aliases: DS.micro.inf DS.micro.inf.pgu DS.micro.inf.pge
###   DS.micro.inf.bbu DS.micro.inf.nnu plot.DS_GF_micro print.DS_GF_micro
###   DS.GF.micro.obj
### Keywords: DS Main Functions

### ** Examples

### MicroInference for Naval Shipyard Data: sample where y = 0 and n = 5
data(ship)
ship.ds <- DS.prior(ship, max.m = 2, c(.5,.5), family = "Binomial")
ship.ds.micro <- DS.micro.inf(ship.ds, y.0 = 0, n.0 = 5)
ship.ds.micro
plot(ship.ds.micro)



