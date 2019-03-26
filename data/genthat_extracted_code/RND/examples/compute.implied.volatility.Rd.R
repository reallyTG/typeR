library(RND)


### Name: compute.implied.volatility
### Title: Compute Impied Volatility
### Aliases: compute.implied.volatility

### ** Examples

#
# Create prices from BSM with various sigma's
#

r     =  0.05
y     =  0.02
te    =  60/365
s0    =  400

sigma.range = seq(from = 0.1, to = 0.8, by = 0.05)
k.range     = floor(seq(from = 300, to = 500, length.out = length(sigma.range)))
bsm.calls   = numeric(length(sigma.range))

for (i in 1:length(sigma.range))
{
  bsm.calls[i] = price.bsm.option(r = r, te = te, s0 = s0, k = k.range[i], 
                                  sigma = sigma.range[i], y = y)$call
}
bsm.calls
k.range

#
# Computed implied sigma's should be very close to sigma.range.
#

compute.implied.volatility(r = r, te = te, s0 = s0, k = k.range, y = y, 
                          call.price = bsm.calls, lower = 0.001, upper = 0.999)
sigma.range




