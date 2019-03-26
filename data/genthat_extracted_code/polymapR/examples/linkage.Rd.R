library(polymapR)


### Name: linkage
### Title: Calculate recombination frequency, LOD and phase
### Aliases: linkage

### ** Examples

data("screened_data3")
SN_SN_P1 <- linkage(dosage_matrix = screened_data3,
                   markertype1 = c(1,0),
                   target_parent = "P1",
                   other_parent = "P2",
                   ploidy = 4,
                   pairing = "random",
                   ncores = 1
                   )



