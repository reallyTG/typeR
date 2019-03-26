library(stability)


### Name: stab_dist
### Title: Stability Distance in AMMI
### Aliases: stab_dist stab_dist.default

### ** Examples

data(ge_data)
YieldDist <-
     stab_dist(
            .data = ge_data
          , .y    = Yield
          , .rep  = Rep
          , .gen  = Gen
          , .env  = Env
          , .m    = 2
      )
YieldDist




