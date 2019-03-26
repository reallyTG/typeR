library(DAISIE)


### Name: DAISIE_margprobdist
### Title: The marginal distribution of endemics and non-endemics under the
###   DAISIE model
### Aliases: DAISIE_margprobdist
### Keywords: models

### ** Examples

### Compute the marginal probability distributions at t = 4 and t = 8, for a mainland
# pool size of 250 potential colonists and a vector of 5 parameters (cladogenesis,
# extinction, clade-level carrying capacity, immigration, anagenesis) starting from
# an empty island

DAISIE_margprobdist(
   pars1 = c(0.3,0.35,Inf,0.75,0.012),
   pars2 = c(100,250),
   tvec = c(4,8),
   initEI = c(5,1),
   initprobs = NULL
   )



