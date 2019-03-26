library(valuer)


### Name: GMWB
### Title: Variable Annuity with GMWB guarantee
### Aliases: GMWB
### Keywords: datasets

### ** Examples

#Sets up the periodic payment.

premium <- 100
beta <- 0.1
GMWB_payment <- payoff_GMWB$new(premium, beta)

#Issue date of the contract
t0 <- timeDate::timeDate("2016-01-01")

#Ten years expiration of the guarantee

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

#Sets up a VA contract with GMWB guarantee type Wa with yearly
#withdrawals for 10 years.

contract <- GMWB$new(GMWB_payment, t0 = t0, t1 = t1, age = age,  fee = fee,
barrier = barrier, penalty = penalty, type = "Wa", freq = "12m")




