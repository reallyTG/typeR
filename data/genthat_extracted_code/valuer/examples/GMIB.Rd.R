library(valuer)


### Name: GMIB
### Title: Variable Annuity with GMIB guarantee
### Aliases: GMIB
### Keywords: datasets

### ** Examples

#Sets up the payoff as a roll-up of premiums with roll-up rate 1%

rate <- constant_parameters$new(0.01)

premium <- 100
rollup <- payoff_rollup$new(premium, rate)


t0 <- timeDate::timeDate("2016-01-01")

#Five year accumulation period
t <- timeDate::timeDate("2020-12-31")

#Five year annuity certain period
t1 <- timeDate::timeDate("2025-12-31")

age <- 60

# A constant fee of 2% per year (365 days)
fee <- constant_parameters$new(0.02)

#Barrier for a state-dependent fee. The fee will be applied only if
#the value of the account is below the barrier
barrier <- 200

#Withdrawal penalty applied in case the insured surrenders the contract
#It is a constant penalty in this case
penalty <- penalty_class$new(type = 1, 0.01)

#Sets up a VA contract with GMIB guarantee, whole-life (Ia).
contract <- GMIB$new(rollup, t0 = t0, t = t, age = age,  fee = fee,
barrier = barrier, penalty = penalty, eta = 0.04)

#Sets up a VA contract with GMIB gurantee annuity-certain with
#maturity t1
contract <- GMIB$new(rollup, t0 = t0, t = t, t1 = t1,  age = age,
fee = fee, barrier = barrier, penalty = penalty, eta = 0.04, type = "Ib")



