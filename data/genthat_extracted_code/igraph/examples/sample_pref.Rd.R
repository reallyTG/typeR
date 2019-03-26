library(igraph)


### Name: sample_pref
### Title: Trait-based random generation
### Aliases: sample_pref sample_asym_pref preference.game
###   asymmetric.preference.game pref sample_asym_pref asym_pref
### Keywords: graphs

### ** Examples


pf <- matrix( c(1, 0, 0, 1), nr=2)
g <- sample_pref(20, 2, pref.matrix=pf)
## Not run: tkplot(g, layout=layout_with_fr)

pf <- matrix( c(0, 1, 0, 0), nr=2)
g <- sample_asym_pref(20, 2, pref.matrix=pf)
## Not run: tkplot(g, layout=layout_in_circle)




