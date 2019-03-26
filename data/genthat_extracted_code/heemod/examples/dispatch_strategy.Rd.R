library(heemod)


### Name: dispatch_strategy
### Title: Dispatch Values According to Strategy
### Aliases: dispatch_strategy

### ** Examples


define_parameters(
  val = 456,
  x = dispatch_strategy(
    strat_1 = 1234,
    strat_2 = 9876,
    strat_3 = val * 2 + markov_cycle
  )
)



