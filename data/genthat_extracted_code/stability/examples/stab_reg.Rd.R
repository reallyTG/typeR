library(stability)


### Name: stab_reg
### Title: Individual Regression for each Genotype
### Aliases: stab_reg stab_reg.default

### ** Examples


data(ge_data)
Yield.StabReg <-
        stab_reg(
            .data = ge_data
          , .y    = Yield
          , .rep  = Rep
          , .gen  = Gen
          , .env  = Env
          )

Yield.StabReg




