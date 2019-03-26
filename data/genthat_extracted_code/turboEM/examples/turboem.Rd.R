library(turboEM)


### Name: turboem
### Title: A suite of acceleration schemes for fixed-point iterations
### Aliases: turboem
### Keywords: optimization, EM algorithm, MM algorithm, fixed-point
###   iteration

### ** Examples

###########################################################################
# Also see the vignette by typing:
#  vignette("turboEM")
#
# EM algorithm for Poisson mixture estimation 

fixptfn <- function(p,y) {
# The fixed point mapping giving a single E and M step of the EM algorithm
# 
pnew <- rep(NA,3)
i <- 0:(length(y)-1)
zi <- p[1]*exp(-p[2])*p[2]^i / (p[1]*exp(-p[2])*p[2]^i + (1 - p[1])*exp(-p[3])*p[3]^i)
pnew[1] <- sum(y*zi)/sum(y)
pnew[2] <- sum(y*i*zi)/sum(y*zi)
pnew[3] <- sum(y*i*(1-zi))/sum(y*(1-zi))
p <- pnew
return(pnew)
}

objfn <- function(p,y) {
# Objective function whose local minimum is a fixed point 
# negative log-likelihood of binary poisson mixture
i <- 0:(length(y)-1)
loglik <- y*log(p[1]*exp(-p[2])*p[2]^i/exp(lgamma(i+1)) + 
		(1 - p[1])*exp(-p[3])*p[3]^i/exp(lgamma(i+1)))
return ( -sum(loglik) )
}

# Real data from Hasselblad (JASA 1969)
poissmix.dat <- data.frame(death = 0:9, 
	freq = c(162,267,271,185,111,61,27,8,3,1))
y <- poissmix.dat$freq

# Use a preset seed so the example is reproducable. 
require("setRNG")
old.seed <- setRNG(list(kind = "Mersenne-Twister", normal.kind = "Inversion",
    seed = 54321))

p0 <- c(runif(1),runif(2,0,4))  # random starting value

# Basic EM algorithm, SQUAREM, and parabolic EM, with default settings
res1 <- turboem(par = p0, y = y, fixptfn = fixptfn, objfn = objfn, 
	method = c("EM", "squarem", "pem"))

# To apply the dynamic ECME (decme) acceleration scheme, 
# we need to include a boundary function
boundary <- function(par, dr) {
	lower <- c(0, 0, 0)
	upper <- c(1, 10000, 10000)
	low1 <- max(pmin((lower-par)/dr, (upper-par)/dr))
	upp1 <- min(pmax((lower-par)/dr, (upper-par)/dr))
	return(c(low1, upp1))
}
res2 <- turboem(par = p0, y = y, fixptfn = fixptfn, objfn = objfn, 
	boundary = boundary, method = c("EM", "squarem", "pem", "decme"))

# change some of the algorithm-specific default specifications (control.method), 
# as well as the global control parameters (control.run)
res3 <- turboem(par = p0, y = y, fixptfn = fixptfn, objfn = objfn, 
  boundary = boundary, method = c("em", "squarem", "squarem", "decme", "qn", "qn"), 
	control.method = list(list(), list(K = 2), list(K = 3), 
		list(version = "v3"), list(qn = 1), list(qn = 2)),
	control.run = list(tol = 1e-12, stoptype = "maxtime", maxtime = 1))

# Only the standard EM algorithm and SQUAREM *do not* require 
# providing the objective function. 
res4 <- turboem(par = p0, y = y, fixptfn = fixptfn, 
	method = c("em", "squarem", "squarem"), 
	control.method = list(list(), list(K = 1), list(K = 2)))
# If no objective function is provided, the "squarem" method defaults to Squarem-2 
# Or, if control parameter K > 1, it defaults to Cyclem-2. 
# Compare Squarem with and without objective function provided:
res5 <- turboem(par = p0, y = y, fixptfn = fixptfn, method = "squarem")
res5
res6 <- turboem(par = p0, y = y, fixptfn = fixptfn, objfn = objfn, method = "squarem")
res6




