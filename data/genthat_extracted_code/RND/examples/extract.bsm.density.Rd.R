library(RND)


### Name: extract.bsm.density
### Title: Extract Lognormal Density
### Aliases: extract.bsm.density

### ** Examples

#
# Create some BSM Based options
#

r     = 0.05
te    = 60/365
s0    = 1000
sigma = 0.25
y     = 0.01

call.strikes   = seq(from = 500, to = 1500, by = 25)
market.calls   = price.bsm.option(r =r, te = te, s0 = s0, 
                 k = call.strikes, sigma = sigma, y = y)$call

put.strikes    = seq(from = 510, to = 1500, by = 25)
market.puts    = price.bsm.option(r =r, te = te, s0 = s0, 
                 k = put.strikes, sigma = sigma, y = y)$put

#
#  Get extract the parameter of the density
#

extract.bsm.density(r = r, y = y, te = te, s0 = s0, market.calls = market.calls, 
               call.strikes = call.strikes,  market.puts = market.puts, 
               put.strikes = put.strikes, lambda = 1, hessian.flag = FALSE)

#
# The extracted parameters should be close to these actual values:
#
actual.mu     = log(s0) + ( r - y - 0.5 * sigma^2) * te
actual.zeta   = sigma * sqrt(te)
actual.mu 
actual.zeta



