library(dils)


### Name: MeasureNetworkInformation
### Title: Measure how much a network informs a particular network measure
### Aliases: MeasureNetworkInformation

### ** Examples

g.rand <- random.graph.game(100, 5/100)
m.rand <- MeasureNetworkInformation(g.rand)
m.rand

pf <- matrix( c(.8, .2, .3, .7), nr=2)
g.pref <- preference.game(100, 2, pref.matrix=pf)
m.pref <- MeasureNetworkInformation(g.pref)
m.pref

m.pref / m.rand  # Relative informativeness of this preference graph
                 # to this random graph with respect to betweenness
## Not run: 
##D prob.of.link <- c(1:50)/100
##D mnis <- sapply(prob.of.link, function(p)
##D   MeasureNetworkInformation(random.graph.game(100, p)))
##D plot(prob.of.link, mnis,
##D      type="l",
##D      main="Network Information of random graphs",
##D      xlab="probability of link formation",
##D      ylab="information")
##D mtext("with respect to betweenness measure", line=0.5)
## End(Not run)



