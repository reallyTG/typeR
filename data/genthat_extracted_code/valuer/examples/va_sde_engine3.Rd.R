library(valuer)


### Name: va_sde_engine3
### Title: Variable Annuity pricing engine with general fund processes and
###   Weibull mortality
### Aliases: va_sde_engine3
### Keywords: datasets

### ** Examples

#Sets up the payoff as a roll-up of premiums with roll-up rate 2%

rate <- constant_parameters$new(0.02)

premium <- 100
rollup <- payoff_rollup$new(premium, rate)

#constant interest rate
r <- constant_parameters$new(0.03)

#Five years time-line
begin <- timeDate::timeDate("2016-01-01")
end <- timeDate::timeDate("2020-12-31")

#Age of the policyholder.
age <- 50
# A constant fee of 2% per year (365 days)
fee <- constant_parameters$new(0.02)

#Barrier for a state-dependent fee. The fee will be applied only if
#the value of the account is below the barrier
barrier <- 200
#Withdrawal penalty applied in case the insured surrenders the contract
#It is a constant penalty in this case
penalty <- penalty_class$new(type = 1, 0.02)
#Sets up the contract with GMAB guarantee
contract <- GMAB$new(rollup, t0 = begin, t = end, age = age, fee = fee,
barrier = barrier, penalty = penalty)

#Sets up a gatherer of the MC point estimates
the_gatherer  <- mc_gatherer$new()
no_of_paths <- 10

#Sets up the pricing engine
engine <- va_sde_engine3$new(contract, financials_BZ2016bis, interest = r)

#Estimates the contract value by means of the static approach

engine$do_static(the_gatherer, no_of_paths)
the_gatherer$get_results()


#Estimates the contract value by means of the mixed approach
#To compare with the static approach we don't simulate the underlying
#fund paths again.

the_gatherer_2 <- mc_gatherer$new()

engine$do_mixed(the_gatherer_2, no_of_paths, degree = 3, freq = "3m",
simulate = FALSE)
the_gatherer_2$get_results()



