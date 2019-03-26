library(stability)


### Name: er_anova
### Title: Eberhart & Russel’s Model ANOVA
### Aliases: er_anova er_anova.default

### ** Examples


data(ge_data)
Yield.er_anova <-
         er_anova(
            .data = ge_data
          , .y    = Yield
          , .rep  = Rep
          , .gen  = Gen
          , .env  = Env
          )
Yield.er_anova





