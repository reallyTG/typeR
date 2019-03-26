library(ergm.ego)


### Name: as.network.egodata
### Title: Construct an Empty "Template" Network Consistent with an
###   Egocentric Sample
### Aliases: as.network.egodata
### Keywords: manip

### ** Examples



data(faux.mesa.high)
summary(faux.mesa.high, print.adj = FALSE)

fmh.ego <- as.egodata(faux.mesa.high)

# Same actor attributes
fmh.template <- as.network(fmh.ego, N=network.size(faux.mesa.high))
summary(fmh.template, print.adj = FALSE)

# Twice the actors, same distribution
fmh2.template <- as.network(fmh.ego, N=2*network.size(faux.mesa.high))
summary(fmh2.template, print.adj = FALSE)




