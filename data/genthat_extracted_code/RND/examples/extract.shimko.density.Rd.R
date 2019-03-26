library(RND)


### Name: extract.shimko.density
### Title: Extract Risk Neutral Density based on Shimko's Method
### Aliases: extract.shimko.density

### ** Examples


#
#  Test the function shimko.extraction.  If BSM holds then a1 = a2 = 0. 
#

r       =  0.05
y       =  0.02
te      =  60/365
s0      =  1000
k       =  seq(from = 800, to = 1200, by = 5)
sigma   =  0.25

bsm.calls = price.bsm.option(r = r, te = te, s0 = s0, k = k, 
                             sigma = sigma, y = y)$call
extract.shimko.density(market.calls = bsm.calls, call.strikes = k, r = r, y = y, te = te, 
                  s0 = s0, lower = -10, upper = 10)

#
# Note: a0 is about equal to sigma, and a1 and a2 are close to zero.
#




