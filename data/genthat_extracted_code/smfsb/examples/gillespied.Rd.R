library(smfsb)


### Name: gillespied
### Title: Simulate a sample path from a stochastic kinetic model described
###   by a stochastic Petri net
### Aliases: gillespied
### Keywords: smfsb

### ** Examples

# load LV model
data(spnModels)
# simulate and plot a realisation
plot(gillespied(LV,T=100,dt=0.01))



