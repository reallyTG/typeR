library(RND)


### Name: extract.gb.density
### Title: Generalized Beta Extraction
### Aliases: extract.gb.density

### ** Examples


#
# create some GB based calls and puts
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
market.calls = price.gb.option(r = r, te = te, y = y, s0 = s0, 
                               k = call.strikes, a = a, b = s0, v = v, w = w)$call

put.strikes  = seq(from = 805, to = 1200, by = 10)
market.puts  = price.gb.option(r = r, te = te, y = y, s0 = s0, 
                               k = put.strikes, a = a, b = s0, v = v, w = w)$put


#
# Extraction...should match the a,b,v,w above. You will also get warning messages.
# Weigths are automatically set to 1.
#

extract.gb.density(r=r, te=te, y = y, s0=s0, market.calls = market.calls, 
              call.strikes = call.strikes, market.puts = market.puts, 
              put.strikes = put.strikes, lambda = 1, hessian.flag = FALSE)




