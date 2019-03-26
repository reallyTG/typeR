library(DAISIE)


### Name: DAISIE_probdist
### Title: The joint distribution of endemics and non-endemics under the
###   DAISIE model
### Aliases: DAISIE_probdist
### Keywords: models

### ** Examples

### Compute the probability distribution at t = 4 and t = 8, for a mainland pool
# size of 250 potential colonists and a vector of 5 parameters (cladogenesis, 
# extinction, clade-level carrying capacity, immigration, anagenesis) starting
# from an empty island

DAISIE_probdist(
   pars1 = c(0.3,0.35,Inf,0.75,0.012),
   pars2 = c(100,250),
   tvec = c(4,8),
   initEI = c(0,0),
   initprobs = NULL
   )



