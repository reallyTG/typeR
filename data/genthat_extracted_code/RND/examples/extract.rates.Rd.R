library(RND)


### Name: extract.rates
### Title: Extract Risk Free Rate and Dividend Yield
### Aliases: extract.rates

### ** Examples

#
# Create calls and puts based on BSM
#

r     = 0.05
te    = 60/365
s0    = 1000
k     = seq(from = 900, to = 1100, by = 25)
sigma = 0.25
y     = 0.01

bsm.obj = price.bsm.option(r =r, te = te, s0 = s0, k = k, sigma = sigma, y = y)

calls = bsm.obj$call
puts  = bsm.obj$put

#
# Extract rates should give the values of r and y above:
#

rates = extract.rates(calls = calls, puts = puts, k = k, s0 = s0, te = te)
rates




