library(HydroMe)


### Name: SSgampt
### Title: A Green-Ampt water infiltration model
### Aliases: SSgampt
### Keywords: models manip

### ** Examples

##Load the data
data(infilt)
gamp.ns=nlsLM(Cumrate~SSgampt(Rate,ks,A), infilt)
summary(gamp.ns)



