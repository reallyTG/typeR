library(stability)


### Name: stab_masv
### Title: Modified Additive Main Effects and Multiplicative Interacion
###   Stability Value
### Aliases: stab_masv stab_masv.default

### ** Examples

data(ge_data)
YieldMASV <-
     stab_masv(
            .data = ge_data
          , .y    = Yield
          , .rep  = Rep
          , .gen  = Gen
          , .env  = Env
          , .m    = 2
      )
YieldMASV




