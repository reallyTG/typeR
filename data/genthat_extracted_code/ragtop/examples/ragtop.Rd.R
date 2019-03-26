library(ragtop)


### Name: ragtop
### Title: Pricing schemes for derivatives using equity-linked default
###   intensity
### Aliases: ragtop ragtop-package

### ** Examples

## Vanilla European exercise
blackscholes(callput=-1, S0=100, K=90, r=0.03, time=1, vola=0.5)
blackscholes(PUT, S0=100, K=90, r=0.03, time=1, vola=0.5,
             default_intensity=0.07, borrow_cost=0.005)
## With a term structure of volatility
## Not run: 
##D black_scholes_on_term_structures(callput=-1, S0=100, K=90, time=1,
##D                                  const_short_rate=0.025,
##D                                  variance_cumulation_fcn = function(T, t) {
##D                                    0.45 ^ 2 * (T - t) + 0.15^2 * max(0, T-0.25)
##D                                  })
## End(Not run)

## Vanilla American exercise
## Not run: 
##D american(PUT, S0=100, K=110, time=0.77, const_short_rate = 0.06,
##D          const_volatility=0.20, num_time_steps=200)
## End(Not run)
## With a term structure of volatility
## Not run: 
##D american(callput=-1, S0=100, K=90, time=1, const_short_rate=0.025,
##D          variance_cumulation_fcn = function(T, t) {
##D              0.45 ^ 2 * (T - t) + 0.15^2 * max(0, T-0.25)
##D          })
## End(Not run)
## With discrete dividends, combined fixed and proportional
divs = data.frame(time=seq(from=0.11, to=2, by=0.25),
                  fixed=seq(1.5, 1, length.out=8),
                  proportional = seq(1, 1.5, length.out=8))
## Not run: 
##D american(callput=-1, S0=100, K=90, time=1, const_short_rate=0.025,
##D          const_volatility=0.20, dividends=divs)
## End(Not run)

## American Exercise Implied Volatility
american_implied_volatility(25,CALL,S0=100,K=100,time=2.2, const_short_rate=0.03)
df250 =  function(t) ( exp(-0.02*t)*exp(-0.03*max(0,t-1.0))) # Simple term structure
df25 = function(T,t){df250(T)/df250(t)} # Relative discount factors
## Not run: 
##D american_implied_volatility(25,-1,100,100,2.2,discount_factor_fcn=df25)
## End(Not run)

## Convertible Bond
## Not Run
pct4 = function(T,t=0) { exp(-0.04*(T-t)) }
cb = ConvertibleBond(conversion_ratio=3.5, maturity=1.5, notional=100,
                     discount_factor_fcn=pct4, name='Convertible')
S0 = 10; p = 6.0; h = 0.10
h_fcn = function(t, S, ...){0.9 * h + 0.1 * h * (S0/S)^p }  # Intensity linked to equity price
## Not run: 
##D find_present_value(S0=S0, instruments=list(Convertible=cb), num_time_steps=250,
##D                    default_intensity_fcn=h_fcn,
##D                    const_volatility = 0.4, discount_factor_fcn=pct4,
##D                    std_devs_width=5)
## End(Not run)

## Fitting Term Structure of Volatility
## Not Run
opts = list(m1=AmericanOption(callput=-1, strike=9.9, maturity=1/12, name="m1"),
            m2=AmericanOption(callput=-1, strike=9.8, maturity=1/6, name="m2"))
## Not run: 
##D vfit = fit_variance_cumulation(S0, opts, c(0.6, 0.8), default_intensity_fcn=h_fcn)
##D print(vfit$volatilities)
## End(Not run)




