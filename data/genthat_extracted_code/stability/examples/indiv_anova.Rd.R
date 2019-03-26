library(stability)


### Name: indiv_anova
### Title: Individual ANOVA for Each Environment
### Aliases: indiv_anova indiv_anova.default

### ** Examples


data(ge_data)
Yield.indiv_anova <-
         indiv_anova(
            .data = ge_data
          , .y    = Yield
          , .rep  = Rep
          , .gen  = Gen
          , .env  = Env
          )
Yield.indiv_anova





