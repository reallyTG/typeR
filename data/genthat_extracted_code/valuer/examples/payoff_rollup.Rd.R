library(valuer)


### Name: payoff_rollup
### Title: Roll-up of premiums payoff class
### Aliases: payoff_rollup
### Keywords: datasets

### ** Examples

rate <- constant_parameters$new(0.01)
premium <- 100
rollup <- payoff_rollup$new(premium, rate)
t1 <- timeDate::timeDate("2016-01-01")
t2 <- timeDate::timeDate("2016-12-31")
rollup$get_payoff(c(120,100), c(t1,t2))



