library(polySegratioMM)


### Name: setInits
### Title: Set up and dump initial values given the model and prior
### Aliases: setInits dumpInits
### Keywords: manip

### ** Examples

## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)

## set up model, priors, inits etc and write files for JAGS
x <- setModel(3,8)
x2 <- setPriors(x)
inits <- setInits(x,x2)
dumpInits(inits)




