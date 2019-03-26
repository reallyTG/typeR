library(RND)


### Name: mln.am.objective
### Title: Objective function for the Mixture of Lognormal of American
###   Options
### Aliases: mln.am.objective

### ** Examples


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

p.3 = 1 - p.1 - p.2
p.3
expected.f0   =  sum(c(p.1, p.2, p.3) * exp(c(u.1,u.2,u.3) + 
                    (c(sigma.1, sigma.2, sigma.3)^2)/2) )
expected.f0  
 
strikes = 30:170

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
### Quickly look at the option values...
###

par(mfrow=c(1,2))
plot(market.calls ~ strikes, type="l")
plot(market.puts  ~ strikes, type="l")
par(mfrow=c(1,1))

###
### ** IMPORTANT **:  The code that follows may take a few seconds.
###                   Copy and paste onto R console the commands
###                   that follow the greater sign >.
###
###
### Next try the objective function.  It should be zero.
### Note: Let weights be the defaults values of 1.
###
#
# > s0      = expected.f0 * exp(-r * te)
# > s0
#
# > mln.am.objective(theta, s0 =s0, r = r, te = te, market.calls = market.calls,  
#                 market.puts = market.puts, strikes = strikes, lambda = 1)
#
###
### Now directly try the optimization with perfect initial values.
###
#
#
# > optim.obj.with.synthetic.data = optim(theta, mln.am.objective, s0 = s0, r=r, te=te, 
#                 market.calls = market.calls, market.puts = market.puts, strikes = strikes, 
#                 lambda = 1, hessian = FALSE , control=list(maxit=10000) )
#
# > optim.obj.with.synthetic.data
#
# > theta
#
###
### It does take a few seconds but the optim converges to exact theta values.
###



