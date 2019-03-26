library(stability)


### Name: stab_kang
### Title: Stability Kang Function
### Aliases: stab_kang stab_kang.default

### ** Examples

data(ge_data)
YieldKang <-
     stab_kang(
            .data = ge_data
          , .y    = Yield
          , .rep  = Rep
          , .gen  = Gen
          , .env  = Env
      )
YieldKang




