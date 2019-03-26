library(dils)


### Name: RelativeNetworkInformation
### Title: Compare how much two networks inform a particular network
###   measure
### Aliases: RelativeNetworkInformation

### ** Examples

g.rand <- random.graph.game(100, 5/100)

pf <- matrix( c(.8, .2, .3, .7), nr=2)
g.pref <- preference.game(100, 2, pref.matrix=pf)

RelativeNetworkInformation(g.rand, g.pref)



