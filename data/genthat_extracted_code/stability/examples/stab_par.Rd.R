library(stability)


### Name: stab_par
### Title: Stability Parameters for Genotypes by Environment Interaction
###   (GEI)
### Aliases: stab_par stab_par.default

### ** Examples


data(ge_data)
Yield.StabPar <-
   stab_par(
            .data   = ge_data
          , .y      = Yield
          , .rep    = Rep
          , .gen    = Gen
          , .env    = Env
          , alpha   = 0.1
          , .envCov = NULL
)

Yield.StabPar




