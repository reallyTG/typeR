library(RND)


### Name: price.ew.option
### Title: Price Options with Edgeworth Approximated Density
### Aliases: price.ew.option

### ** Examples


#
# Here, the prices must match EXACTLY the BSM prices:
#

r       = 0.05
y       = 0.03
s0      = 1000
sigma   = 0.25
te      = 100/365
k       = seq(from=800, to = 1200, by = 50)
v       = sqrt(exp(sigma^2 * te) - 1)
ln.skew = 3 * v + v^3
ln.kurt = 16 * v^2 + 15 * v^4 + 6 * v^6 + v^8

ew.option.prices  =  price.ew.option(r = r, te = te, s0 = s0, k=k, sigma=sigma, 
                                     y=y, skew = ln.skew, kurt = ln.kurt)
bsm.option.prices =  price.bsm.option(r = r, te = te, s0 = s0, k=k, sigma=sigma, y=y)

ew.option.prices
bsm.option.prices

###
### Now ew prices should be different as we increase the skewness and kurtosis:
###

new.skew = ln.skew * 1.10
new.kurt = ln.kurt * 1.10

new.ew.option.prices  =  price.ew.option(r = r, te = te, s0 = s0, k=k, sigma=sigma, 
                                         y=y, skew = new.skew, kurt = new.kurt)
new.ew.option.prices
bsm.option.prices




