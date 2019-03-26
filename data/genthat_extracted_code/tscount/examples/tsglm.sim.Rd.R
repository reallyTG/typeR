library(tscount)


### Name: tsglm.sim
### Title: Simulate a Time Series Following a Generalised Linear Model
### Aliases: tsglm.sim
### Keywords: Simulation

### ** Examples

#Simulate from an INGARCH model with two interventions:
interventions <- interv_covariate(n=200, tau=c(50, 150), delta=c(1, 0.8))
model <- list(past_obs=1, past_mean=c(1, 7), external=FALSE)
param <- list(intercept=2, past_obs=0.3, past_mean=c(0.2, 0.1), xreg=c(3, 10))
tsglm.sim(n=200, param=param, model=model, xreg=interventions, link="identity",
          distr="nbinom", distrcoefs=c(size=1))



