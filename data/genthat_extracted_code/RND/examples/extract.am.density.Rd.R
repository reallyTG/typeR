library(RND)


### Name: extract.am.density
### Title: Mixture of Lognormal Extraction for American Options
### Aliases: extract.am.density

### ** Examples


###
### Try with synthetic data first.
###

r       = 0.01
te      = 60/365
w.1     = 0.4
w.2     = 0.25
u.1     = 4.2
u.2     = 4.5
u.3     = 4.8
sigma.1 = 0.30
sigma.2 = 0.20
sigma.3 = 0.15
p.1     = 0.25
p.2     = 0.45
theta   = c(w.1,w.2,u.1,u.2,u.3,sigma.1,sigma.2,sigma.3,p.1,p.2)
p.3     = 1 - p.1 - p.2

###
### Generate some synthetic American calls & puts
###

expected.f0   =  sum(c(p.1, p.2, p.3) * exp(c(u.1,u.2,u.3) + 
                    (c(sigma.1, sigma.2, sigma.3)^2)/2) )
expected.f0  
 
strikes = 50:150

market.calls = numeric(length(strikes))
market.puts  = numeric(length(strikes))

for (i in 1:length(strikes))
{

  if ( strikes[i] < expected.f0) {
    market.calls[i] = price.am.option(k = strikes[i], r = r, te = te, w = w.1, u.1 = u.1, 
                      u.2 = u.2, u.3 = u.3, sigma.1 = sigma.1, sigma.2 = sigma.2, 
                      sigma.3 = sigma.3, p.1 = p.1, p.2 = p.2)$call.value

    market.puts[i]  = price.am.option(k = strikes[i], r = r, te = te, w = w.2, u.1 = u.1, 
                      u.2 = u.2, u.3 = u.3, sigma.1 = sigma.1, sigma.2 = sigma.2, 
                      sigma.3 = sigma.3, p.1 = p.1, p.2 = p.2)$put.value 
  }  else {

    market.calls[i] = price.am.option(k = strikes[i], r = r, te = te, w = w.2, u.1 = u.1, 
                      u.2 = u.2, u.3 = u.3, sigma.1 = sigma.1, sigma.2 = sigma.2, 
                      sigma.3 = sigma.3, p.1 = p.1, p.2 = p.2)$call.value

    market.puts[i]  = price.am.option(k = strikes[i], r = r, te = te, w = w.1, u.1 = u.1, 
                      u.2 = u.2, u.3 = u.3, sigma.1 = sigma.1, sigma.2 = sigma.2, 
                      sigma.3 = sigma.3, p.1 = p.1, p.2 = p.2)$put.value 
     }

}


###
### ** IMPORTANT **:  The code that follows may take 1-2 minutes.
###                   Copy and paste onto R console the commands
###                   that follow the greater sign >.
###
### Try the optimization with exact inital values.  
### They should be close the actual initials.
###
#
# > s0      = expected.f0 * exp(-r * te)
# > s0
#
# > extract.am.density(initial.values = theta, r = r, te = te, s0 = s0, 
#                  market.calls = market.calls, market.puts = market.puts, strikes = strikes, 
#                  lambda = 1, hessian.flag = FALSE)
#
# > theta
#
###
### Now try without our the correct initial values...
###
#
# > optim.obj.no.init = extract.am.density( r = r, te = te, s0 = s0, 
#                   market.calls = market.calls, market.puts = market.puts, strikes = strikes, 
#                    lambda = 1, hessian.flag = FALSE)
#
# > optim.obj.no.init
# > theta
#
###
### We do get different values but how do the densities look like?
###
#
###
### plot the two densities side by side
###
#
# > x = 10:190
#
# > y.1 = dmln.am(x = x, p.1 = theta[9], p.2 = theta[10],
#           u.1 = theta[3], u.2 = theta[4], u.3 = theta[5], 
#          sigma.1 = theta[6], sigma.2 = theta[7], sigma.3 = theta[8] )
#
# > o = optim.obj.no.init
#
# > y.2 = dmln.am(x = x, p.1 = o$p.1, p.2 = o$p.2,
#           u.1 = o$u.1, u.2 = o$u.2, u.3 = o$u.3, 
#           sigma.1 = o$sigma.1, sigma.2 = o$sigma.2, sigma.3 = o$sigma.3 )
#
# > matplot(x, cbind(y.1,y.2), main = "Exact = Black, Approx = Red", type="l", lty=1)
#
###
### Densities are close.
###





