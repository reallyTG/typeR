library(stability)


### Name: ammi_biplot
### Title: Additive Main Effects and Multiplicative Interaction (AMMI)
###   Biplot
### Aliases: ammi_biplot ammi_biplot.default

### ** Examples


data(ge_data)
     ammi_biplot(
            .data = ge_data
          , .y    = Yield
          , .rep  = Rep
          , .gen  = Gen
          , .env  = Env
      )






