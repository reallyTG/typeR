library(stability)


### Name: ammi
### Title: Additive Main Effects and Multiplicative Interaction (AMMI)
### Aliases: ammi ammi.default

### ** Examples


data(ge_data)
Yield.ammi <-
     ammi(
            .data = ge_data
          , .y    = Yield
          , .rep  = Rep
          , .gen  = Gen
          , .env  = Env
      )
Yield.ammi






