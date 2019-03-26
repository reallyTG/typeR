library(valuer)


### Name: va_mkh_engine
### Title: Variable Annuity pricing engine with GBM and Makeham
### Aliases: va_mkh_engine
### Keywords: datasets

### ** Examples

#Sets up the payoff as a roll-up of premiums with roll-up rate 1%

rate <- constant_parameters$new(0.01)

premium <- 100
rollup <- payoff_rollup$new(premium, rate)

#Ten years time-line
begin <- timeDate::timeDate("2016-01-01")
end <- timeDate::timeDate("2025-12-31")

#Age of the policyholder.
age <- 60
# A constant fee of 4% per year (365 days)
fee <- constant_parameters$new(0.04)

#Barrier for a state-dependent fee. The fee will be applied only if
#the value of the account is below the barrier
barrier <- Inf
#Withdrawal penalty applied in case the insured surrenders the contract
#It is a constant penalty in this case
penalty <- penalty_class$new(type = 1, 0.01)
#Sets up the contract with GMAB guarantee
contract <- GMAB$new(rollup, t0 = begin, t = end, age = age, fee = fee,
barrier = barrier, penalty = penalty)

#Interest rate
r <- constant_parameters$new(0.03)
#Initial value of the underlying fund
spot <- 100
#Volatility
vol <- constant_parameters$new(0.2)
#Dividend rate
div <- constant_parameters$new(0.0)
#Gatherer for the MC point estimates
the_gatherer <- mc_gatherer$new()
#Number of paths to simulate
no_of_paths <- 1e2

#Sets up the pricing engine specifying the va_contract, the interest rate
#the parameters of the Makeham intensity of mortality, the initial fund
#value, the volatility and dividends rate
engine <- va_mkh_engine$new(contract, r, A = 0.0001, B = 0.00035, spot,
volatility = vol, dividends = div, c = 1.075)

#Estimates the contract value by means of the static approach.

engine$do_static(the_gatherer, no_of_paths)
the_gatherer$get_results()

#Estimates the contract value by means of the mixed approach.
#To compare with the static approach we won't simulate the underlying
#fund paths again.

the_gatherer_2 <- mc_gatherer$new()

engine$do_mixed(the_gatherer_2, no_of_paths, degree = 3,
freq = "3m", simulate = FALSE)
the_gatherer_2$get_results()



