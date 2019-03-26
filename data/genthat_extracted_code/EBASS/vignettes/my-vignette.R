## ------------------------------------------------------------------------
library(EBASS)
object_lambda <- create_object_lambda (20000)

## ------------------------------------------------------------------------
object_inmb <- create_object_inmb(de = 0.04, dc=-168, object_lambda = object_lambda)
object_inmb$get_inmb()

## ------------------------------------------------------------------------
object_inmb_direct <- create_object_inmb_direct(inmb = 968)

## ------------------------------------------------------------------------
object_var_inmb <- create_object_var_inmb(sde=0.12, sdc=2100, rho=0.1, object_lambda=object_lambda)
object_var_inmb$get_var_inmb()

## ------------------------------------------------------------------------
# Modify the lambda value
object_lambda$set_lambda(10000)
# See that inmb and var_inmb were affected by this modification :
cat ("The new INMB value is :",object_inmb$get_inmb(), "and its variance :",  
     object_var_inmb$get_var_inmb())
# reset the value to 20 000
object_lambda$set_lambda(20000)

## ------------------------------------------------------------------------
object_pop <- create_object_pop(horizon = 20, discount=0.04, N_year = 52000)

## ------------------------------------------------------------------------
object_evpi_decrease <- create_object_evpi_decrease(object_inmb, object_pop, object_var_inmb)
# As the allocation ratio is 1:1, setting a number of 150 participants 
# in the experimental group means we will have the same number in the reference group
cat ("EVPI remaining after the inclusion of 300 participants : ",
     object_evpi_decrease$set_N_exp(150), "\n",
     "EVPI remaining after the inclusion of 302 participants : ",
     object_evpi_decrease$set_N_exp(151))

## ------------------------------------------------------------------------
# EVPI_300 - EVPI_302
cat ("EVPI decrement between the inclusion of 302 and 300 participants :  ",
     object_evpi_decrease$set_N_exp(150) - object_evpi_decrease$set_N_exp(151))

## ------------------------------------------------------------------------
cat((object_evpi_decrease$set_N_exp(150) - object_evpi_decrease$set_N_exp(151)) - 2 * 2257.25)

## ------------------------------------------------------------------------
cost_indiv <- 2257.25
n_subject <- sample_size(object_evpi_decrease = object_evpi_decrease, cost_indiv =  cost_indiv)

## ------------------------------------------------------------------------
cat("difference between information gain and inclusion costs for participants 327 and 328 :",
(object_evpi_decrease$set_N_exp(163) - object_evpi_decrease$set_N_exp(164)) - 2 * cost_indiv)
cat("difference between information gain and inclusion costs for participants 329 and 330 :",
(object_evpi_decrease$set_N_exp(164) - object_evpi_decrease$set_N_exp(165)) - 2 * cost_indiv)
graph_gain_n(object_evpi_decrease, cost_indiv)

## ------------------------------------------------------------------------
object_evpi_decrease$set_N_exp(164)
gamma_risk(object_evpi_decrease = object_evpi_decrease)

## ---- echo=T, results='hide'---------------------------------------------
# calculate samples size for time horizon between 1 and 20 years
time_horizon <- seq (1:20)
Nindividuals <- sapply(time_horizon, function(x){
  object_pop$set_horizon(x)
  return (sample_size(object_evpi_decrease, cost_indiv)$N)
})
# plot the result
plot(time_horizon, Nindividuals, xlab="Time horizon in years",
     ylab="Number of individuals to include in the study",xaxt="n", type="b", pch=20)
axis(side=1, at=time_horizon, labels=as.character(time_horizon))

## ---- echo=F-------------------------------------------------------------

## ---- results='hide', fig.show='hide'------------------------------------
# results hidden
library(EBASS)
object_lambda <- create_object_lambda (20000)
object_inmb <- create_object_inmb(de = 0.04, dc=-168, object_lambda = object_lambda)
object_var_inmb <- create_object_var_inmb(sde=0.12, sdc=2100, rho=0.1, object_lambda=object_lambda)
object_pop <- create_object_pop(horizon = 20, discount=0.04, N_year = 52000)
object_evpi_decrease <- create_object_evpi_decrease(object_inmb, object_pop, object_var_inmb)
cost_indiv <- 2257.25
n_subject <- sample_size (object_evpi_decrease, cost_indiv)
graph_gain_n (object_evpi_decrease, cost_indiv)
gamma_risk (object_evpi_decrease)
time_horizon <- seq (1:20)
Nindividuals <- sapply(time_horizon, function(x){
  object_pop$set_horizon(x)
  return (sample_size(object_evpi_decrease, cost_indiv)$N)
})
plot(time_horizon, Nindividuals, xlab="Time horizon in years",
     ylab="Number of individuals to include in the study",xaxt="n", type="b", pch=20)
axis(side=1, at=time_horizon, labels=as.character(time_horizon))

