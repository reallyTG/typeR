library(RND)


### Name: extract.ew.density
### Title: Extract Edgeworth Based Density
### Aliases: extract.ew.density

### ** Examples


#
#  ln.skew & ln.kurt are the normalized skewness and kurtosis of a true lognormal.
#

r       = 0.05
y       = 0.03
s0      = 1000
sigma   = 0.25
te      = 100/365
strikes = seq(from=600, to = 1400, by = 1)
v       = sqrt(exp(sigma^2 * te) - 1)
ln.skew = 3 * v + v^3
ln.kurt = 16 * v^2 + 15 * v^4 + 6 * v^6 + v^8

#
# Now "perturb" the lognormal
#

new.skew = ln.skew * 1.50
new.kurt = ln.kurt * 1.50

#
# new.skew & new.kurt should not be extracted.
# Note that weights are automatically set to 1.
#

market.calls      =  price.ew.option(r = r, te = te, s0 = s0, k=strikes, sigma=sigma, 
                     y=y, skew = new.skew, kurt = new.kurt)$call
ew.extracted.obj  =  extract.ew.density(r = r, y = y, te = te, s0 = s0, 
                     market.calls = market.calls, call.strikes = strikes, 
                     lambda = 1, hessian.flag = FALSE)
ew.extracted.obj



