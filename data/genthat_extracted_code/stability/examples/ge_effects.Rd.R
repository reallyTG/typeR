library(stability)


### Name: ge_effects
### Title: Genotype by Environment Interaction Effects
### Aliases: ge_effects ge_effects.default

### ** Examples


data(ge_data)
Yield.Effects <-
              ge_effects(
                .data  = ge_data
               , .y    = Yield
               , .gen  = Gen
               , .env  = Env
               )
names(Yield.Effects)

Yield.Effects$ge_means
Yield.Effects$ge_effects
Yield.Effects$gge_effects





