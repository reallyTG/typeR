library(dils)


### Name: EdgelistFill
### Title: Ensure an edgelist has all dyads and a column of weights.
### Aliases: EdgelistFill

### ** Examples

g <- erdos.renyi.game(10, 2/10)
EdgelistFill(get.edgelist(g))
EdgelistFill(get.edgelist(g), nodelist=1:10)

E(g)$weight <- runif(ecount(g))
el <- cbind(get.edgelist(g), E(g)$weight)
EdgelistFill(el)
EdgelistFill(el, nodelist=1:10)



