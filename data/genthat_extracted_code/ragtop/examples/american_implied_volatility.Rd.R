library(ragtop)


### Name: american_implied_volatility
### Title: Implied volatility of an american option with equity-independent
###   term structures
### Aliases: american_implied_volatility
### Keywords: calibration

### ** Examples

american_implied_volatility(25,CALL,S0=100,K=100,time=2.2,
  const_short_rate=0.03, num_time_steps=5)
df250 =  function(t) ( exp(-0.02*t)*exp(-0.03*max(0,t-1.0))) # Simple term structure
df25 = function(T,t){df250(T)/df250(t)} # Relative discount factors
american_implied_volatility(25,-1,100,100,2.2,
  discount_factor_fcn=df25, num_time_steps=5)



