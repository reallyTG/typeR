library(bipartite)


### Name: dfun
### Title: Calculates standardised specialisation index d' (d prime) for
###   each species in the lower trophic level of a bipartite network.
### Aliases: dfun
### Keywords: htest

### ** Examples

data(Safariland)
dfun(Safariland) # gives d-values for the lower trophic level
# now using independent abundance estimates for higher trophic level:
dfun(Safariland, abuns=runif(ncol(Safariland)))

dfun(t(Safariland)) #gives d-values for the higher trophic level



