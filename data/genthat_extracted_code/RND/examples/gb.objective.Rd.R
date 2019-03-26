library(RND)


### Name: gb.objective
### Title: Generalized Beta Objective
### Aliases: gb.objective

### ** Examples


#
# The objective should be very small!
# Note the weights are automatically
# set to 1.
#

r  = 0.03
te = 50/365
k  = seq(from = 800, to = 1200, by = 10)
a  = 10
b  = 1000
v  = 2.85
w  = 2.85
y  = 0.01
s0 = exp((y-r)*te) * b * beta(v + 1/a, w - 1/a)/beta(v,w) 
s0

call.strikes = seq(from = 800, to = 1200, by = 10)
market.calls = price.gb.option(r = r, te = te, s0 = s0, y = y, 
                        k = call.strikes, a = a, b = b, v = v, w = w)$call

put.strikes = seq(from = 805, to = 1200, by = 10)
market.puts = price.gb.option(r = r, te = te, s0 = s0, y = y, 
                        k = put.strikes, a = a, b = b, v = v, w = w)$put

gb.objective(theta=c(a,b,v,w),r = r, te = te, y = y, s0 = s0, 
             market.calls = market.calls, call.strikes = call.strikes,  
             market.puts = market.puts, put.strikes = put.strikes, lambda = 1)





