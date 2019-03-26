library(RND)


### Name: ew.objective
### Title: Edgeworth Exapnsion Objective Function
### Aliases: ew.objective

### ** Examples


r       = 0.05
y       = 0.03
s0      = 1000
sigma   = 0.25
te      = 100/365
k       = seq(from=800, to = 1200, by = 50)
v       = sqrt(exp(sigma^2 * te) - 1)
ln.skew = 3 * v + v^3
ln.kurt = 16 * v^2 + 15 * v^4 + 6 * v^6 + v^8

#
# The objective function should be close to zero.  
# Also the weights are automatically set to 1.
#

market.calls.bsm = price.bsm.option(r = r, te = te, s0 = s0, k=k, 
                   sigma=sigma, y=y)$call
ew.objective(theta = c(sigma, ln.skew, ln.kurt), r = r, y = y, te = te, s0=s0, 
             market.calls = market.calls.bsm, call.strikes = k, lambda = 1)





