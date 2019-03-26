library(DAISIE)


### Name: DAISIE_sim
### Title: Simulate islands with given parameters.
### Aliases: DAISIE_sim
### Keywords: models

### ** Examples
 
cat("
## Simulate 40 islands for 4 million years, where all species have equal 
## rates, and plot the species-through-time plot. Pool size 1000.

pars_equal = c(2.550687345,2.683454548,Inf,0.00933207,1.010073119)
island_replicates_equal = DAISIE_sim(
   time = 4,
   M = 1000,
   pars = pars_equal,
   replicates = 40
   )

## Simulate 15 islands for 4 million years with two types of species (type1 
## and type 2), and plot the species-through-time plot. Pool size 1000. Fraction
## of type 2 species in source pool is 0.163. Function will simulate until number of islands
## where type 2 species has colonised is equal to number specified in replicates.

pars_type1 = c(0.195442017,0.087959583,Inf,0.002247364,0.873605049)
pars_type2 = c(3755.202241,8.909285094,14.99999923,0.002247364,0.873605049)
island_replicates_2types = DAISIE_sim(
   time = 4,
   M = 1000,
   pars = c(pars_type1,pars_type2),
   replicates = 15,
   prop_type2_pool = 0.163
   )
")



