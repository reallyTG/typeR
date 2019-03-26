library(streambugs)


### Name: streambugs.get.sys.def
### Title: Get system definition of the streambugs ODE model
### Aliases: streambugs.get.sys.def

### ** Examples

m <- streambugs.example.model.toy()
sys.def <- streambugs.get.sys.def(y.names=m$y.names, par=m$par, inp=m$inp)
# Get inital conditions for all state variables
sys.def$par.initcond$parvals
# Get stoichiometric coefficients of consumption within the food web
sys.def$par.stoich.web$Cons
# Get stoichiometric coefficients of death process for each taxon
# (transforming them into a dead organic matter "POM")
sys.def$par.stoich.taxon$Death




