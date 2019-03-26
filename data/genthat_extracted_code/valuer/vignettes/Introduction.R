## ------------------------------------------------------------------------
library(valuer)

rate <- constant_parameters$new(0.02)

premium <- 100


## ------------------------------------------------------------------------

rollup <- payoff_rollup$new(premium, rate)


## ------------------------------------------------------------------------

t1 <- timeDate::timeDate("2016-01-01")

t2 <- timeDate::timeDate("2020-12-31")

rollup$get_payoff(108, c(t1,t2))



## ------------------------------------------------------------------------

# A constant fee of 2% per year
fee <- constant_parameters$new(0.02)

#Barrier for a state-dependent fee. The fee will be applied only if
#the value of the account is below the barrier
barrier <- 200


## ------------------------------------------------------------------------
#Withdrawal penalty applied in case the insured surrenders the contract

penalty <- penalty_class$new(type = 1, 0.01)


## ------------------------------------------------------------------------
penalty <- penalty_class$new(type = 2, const = 0.08, T = 5)

penalty$get(0)

penalty$get(5)


## ------------------------------------------------------------------------
penalty <- penalty_class$new(type = 3, const = 0.08, T = 5)

penalty$get(0)

penalty$get(5)


## ------------------------------------------------------------------------
#Five years time-line
begin <- timeDate::timeDate("2016-01-01")
end <- timeDate::timeDate("2020-12-31")

#Age of the policyholder.
age <- 60

#Sets up a VA contract with GMAB guarantee.
contract <- GMAB$new(rollup, t0 = begin, t = end, age = age, fee = fee, barrier = barrier, penalty = penalty)


## ------------------------------------------------------------------------

contract$set_age(50)
contract$get_age()

contract$set_barrier(200)
contract$get_barrier()


contract$set_fee(constant_parameters$new(0.03))


## ------------------------------------------------------------------------
contract$set_penalty(0.04)

head(contract$get_penalty())

penalty2 <- penalty_class$new(type = 2, const = 0.08, T = 5)

contract$set_penalty_object(penalty2)

head(contract$get_penalty())

## ------------------------------------------------------------------------

#Interest rate
r <- constant_parameters$new(0.03)

#Initial value of the underlying fund
spot <- premium

#Volatility
vol <- constant_parameters$new(0.2)

#Dividend rate
div <- constant_parameters$new(0.0)

#Sets up the pricing engine specifying the va_contract, the interest rate
#the parameters of the Weibull intensity of mortality, the initial fund
#value, the volatility and dividends rate
engine <- va_bs_engine$new(contract, r, c1=90.43, c2=10.36, spot,
volatility=vol, dividends=div)

## ---- echo = FALSE-------------------------------------------------------

set.seed(1)


## ------------------------------------------------------------------------

#Number of paths to simulate
no_of_paths <- 1e3

#Gatherer for the MC point estimates
the_gatherer <- mc_gatherer$new()

engine$do_static(the_gatherer, no_of_paths)
the_gatherer$get_results()


## ---- fig.height = 5, fig.width = 7.15-----------------------------------
engine$do_mixed(the_gatherer, no_of_paths, degree = 3, freq = "3m", simulate = FALSE)

the_gatherer$get_results()

the_gatherer$plot()

## ------------------------------------------------------------------------
financials_BMOP2011

mortality_BMOP2011



## ------------------------------------------------------------------------

engine <- va_sde_engine$new(contract, financials_BMOP2011, mortality_BMOP2011)



## ---- eval=FALSE---------------------------------------------------------
#  
#  engine$do_static(the_gatherer, no_of_paths)
#  the_gatherer$get_results()
#  
#  engine$do_mixed(the_gatherer, no_of_paths, degree = 3, freq = "3m", simulate = FALSE)
#  the_gatherer$get_results()
#  

## ---- eval=FALSE---------------------------------------------------------
#  
#  library(doParallel)
#  
#  cl <- makeCluster(2)
#  
#  registerDoParallel(cl)
#  
#  engine$do_mixed(the_gatherer, no_of_paths)
#  
#  

