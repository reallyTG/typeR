library(dils)


### Name: RssSuggestedNetwork
### Title: Suggest a network with imputed links
### Aliases: RssSuggestedNetwork

### ** Examples

g <- graph.atlas(128)
## Not run: plot(g)

suggested <- RssSuggestedNetwork(g, q.impute.above=.6)
## Not run: plot(suggested$g.imputed)
suggested$frac.filled



