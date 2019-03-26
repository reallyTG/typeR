library(valuer)


### Name: va_bs_engine2
### Title: Variable Annuity pricing engine with GBM and generic mortality
### Aliases: va_bs_engine2
### Keywords: datasets

### ** Examples

## Not run: 
##D #Sets up the payoff as a roll-up of premiums with roll-up rate 1%
##D 
##D rate <- constant_parameters$new(0.01)
##D 
##D premium <- 100
##D rollup <- payoff_rollup$new(premium, rate)
##D 
##D #Ten years time-line
##D begin <- timeDate::timeDate("2016-01-01")
##D end <- timeDate::timeDate("2025-12-31")
##D 
##D #Age of the policyholder.
##D age <- 60
##D # A constant fee of 4% per year (365 days)
##D fee <- constant_parameters$new(0.04)
##D 
##D #Barrier for a state-dependent fee. The fee will be applied only if
##D #the value of the account is below the barrier
##D barrier <- Inf
##D #Withdrawal penalty applied in case the insured surrenders the contract
##D #It is a constant penalty in this case
##D penalty <- penalty_class$new(type = 1, 0.01)
##D #Sets up the contract with GMAB guarantee
##D contract <- GMAB$new(rollup, t0 = begin, t = end, age = age, fee = fee,
##D barrier = barrier, penalty = penalty)
##D 
##D #Interest rate
##D r <- constant_parameters$new(0.03)
##D #Initial value of the underlying fund
##D spot <- 100
##D #Volatility
##D vol <- constant_parameters$new(0.2)
##D #Dividend rate
##D div <- constant_parameters$new(0.0)
##D #Gatherer for the MC point estimates
##D the_gatherer <- mc_gatherer$new()
##D #Number of paths to simulate
##D no_of_paths <- 10
##D 
##D #Sets up the pricing engine specifying the va_contract, the interest rate
##D #the parameters of the Weibull intensity of mortality, the initial fund
##D #value, the volatility and dividends rate
##D engine <- va_bs_engine2$new(contract, r, spot,
##D volatility=vol, dividends=div, mortality_BMOP2011)
##D 
##D #Estimates the contract value by means of the static approach.
##D 
##D engine$do_static(the_gatherer, no_of_paths)
##D the_gatherer$get_results()
##D 
##D #Estimates the contract value by means of the mixed approach.
##D #To compare with the static approach we won't simulate the underlying
##D #fund paths again.
##D 
##D the_gatherer_2 <- mc_gatherer$new()
##D 
##D engine$do_mixed(the_gatherer_2, no_of_paths, degree = 3,
##D freq = "3m", simulate = FALSE)
##D the_gatherer_2$get_results()
## End(Not run)



