library(RND)


### Name: bsm.objective
### Title: BSM Objective Function
### Aliases: bsm.objective

### ** Examples

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

###
### perfect initial values under BSM framework
###

mu.0     = log(s0) + ( r - y - 0.5 * sigma^2) * te
zeta.0   = sigma * sqrt(te)
mu.0
zeta.0

###
### The objective function should be *very* small
###

bsm.obj.val = bsm.objective(theta=c(mu.0, zeta.0), r = r, y=y, te = te, s0 = s0, 
              market.calls = market.calls, call.strikes = call.strikes, 
              market.puts  = market.puts,  put.strikes = put.strikes, lambda = 1)
bsm.obj.val



