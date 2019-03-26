library(valuer)


### Name: GMDB
### Title: Variable Annuity with GMDB guarantee
### Aliases: GMDB
### Keywords: datasets

### ** Examples

#Sets up the payoff as a roll-up of premiums with roll-up rate 2%

rate <- constant_parameters$new(0.02)

premium <- 100
rollup <- payoff_rollup$new(premium, rate)

begin <- timeDate::timeDate("2016-01-01")
end <- timeDate::timeDate("2020-12-31")

age <- 60
# A constant fee of 0.02% per year (365 days)
fee <- constant_parameters$new(0.02)

#Barrier for a state-dependent fee. The fee will be applied only if
#the value of the account is below the barrier
barrier <- Inf

#Withdrawal penalty applied in case the insured surrenders the contract
#It is a constant penalty in this case
penalty <- penalty_class$new(type = 1, 0.01)

#Sets up a VA contract with GMDB guarantee. The guaranteed miminum
#is the roll-up of premiums with rate 2%

contract <- GMDB$new(rollup, t0 = begin, t = end, age = age,  fee = fee,
barrier = barrier, penalty = penalty)



