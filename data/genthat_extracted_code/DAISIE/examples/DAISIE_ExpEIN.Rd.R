library(DAISIE)


### Name: DAISIE_ExpEIN
### Title: The expected number of endemics and non-endemics under the
###   DAISIE model
### Aliases: DAISIE_ExpEIN
### Keywords: models

### ** Examples

### Compute the expected values at t = 4, for a mainland pool size of 1000 potential
# colonists and a vector of 5 parameters (cladogenesis, extinction, clade-level carrying
# capacity, immigration, anagenesis)
 
DAISIE_ExpEIN(
   t = 4,
   pars = c(0.5,0.1,Inf,0.01,0.4),
   M = 1000
   )



