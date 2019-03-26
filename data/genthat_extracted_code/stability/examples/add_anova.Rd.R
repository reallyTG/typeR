library(stability)


### Name: add_anova
### Title: Additive ANOVA for Genotypes by Environment Interaction (GEI)
###   model
### Aliases: add_anova add_anova.default

### ** Examples

data(ge_data)
YieldANOVA <-
     add_anova(
            .data = ge_data
          , .y    = Yield
          , .rep  = Rep
          , .gen  = Gen
          , .env  = Env
      )
YieldANOVA




