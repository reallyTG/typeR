library(stability)


### Name: stab_measures
### Title: Stability Measures for Genotypes by Environment Interaction
###   (GEI)
### Aliases: stab_measures stab_measures.default

### ** Examples


data(ge_data)
Yield.StabMeasures <- stab_measures(
                .data  = ge_data
               , .y    = Yield
               , .gen  = Gen
               , .env  = Env
               )
Yield.StabMeasures






