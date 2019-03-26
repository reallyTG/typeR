library(simecol)


### Name: sim-methods
### Title: Simulation of 'simObj' model objects
### Aliases: sim sim-methods sim,gridModel-method sim,odeModel-method
###   sim,simObj-method
### Keywords: methods programming

### ** Examples

data(lv)
plot(sim(lv))

lv2 <- lv
parms(lv2)["k1"] <- 0.5
lv2 <- sim(lv2)
plot(out(lv2))



