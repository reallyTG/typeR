library(isqg)


### Name: mating
### Title: Breed Simulated Individuals According to Basic Mating Schemes
### Aliases: mating cross selfcross dh

### ** Examples

data(ToyMap)
spc <- set_specie(ToyMap)
AA <- founder(spc, "AA")
aa <- founder(spc, "aa")

## Mather Design
F1  <- cross(n = 1, AA, aa)
BC1 <- cross(n = 5, F1, AA)
BC2 <- F1$cross(n = 5, aa)   # using R6 methods
F2  <- selfcross(n = 10, F1) 
RIL <- dh(n = 10, F1) 
## chainable R6 methods
F3  <- F1$selfcross(n = 1, replace = TRUE)$selfcross(n = 1, replace = TRUE)




