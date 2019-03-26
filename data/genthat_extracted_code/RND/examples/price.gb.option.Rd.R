library(RND)


### Name: price.gb.option
### Title: Generalized Beta Option Pricing
### Aliases: price.gb.option

### ** Examples


#
# A basic GB option pricing....
#

r  = 0.03
te = 50/365
s0 = 1000.086
k  = seq(from = 800, to = 1200, by = 10)
y  = 0.01
a  = 10
b  = 1000
v  = 2.85
w  = 2.85

price.gb.option(r = r, te = te, s0 = s0, k = k, y = y, a = a, b = b, v = v, w = w)




