library(turboEM)


### Name: turbo
### Title: Methods for objects of class "turbo"
### Aliases: turbo print.turbo pars pars.turbo error error.turbo plot.turbo
###   grad grad.turbo hessian hessian.turbo stderror stderror.turbo

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
poissmix.dat <- data.frame(death=0:9, freq=c(162,267,271,185,111,61,27,8,3,1))
y <- poissmix.dat$freq

# Use a preset seed so the example is reproducable. 
require("setRNG")
old.seed <- setRNG(list(kind="Mersenne-Twister", normal.kind="Inversion",
    seed=1))

p0 <- c(runif(1),runif(2,0,4))  # random starting value

# Basic EM algorithm, SQUAREM, and parabolic EM, with default settings
res1 <- turboem(par=p0, y=y, fixptfn=fixptfn, objfn=objfn, method=c("EM", "squarem", "pem"))

# Apply methods for class "turbo"
res1
pars(res1)
grad(res1)
hessian(res1)
stderror(res1)
error(res1)

# We get an error for Dynamic ECME (decme) if we do not specify the boundary function
res2 <- turboem(par=p0, y=y, fixptfn=fixptfn, objfn=objfn, 
  method=c("EM", "squarem", "pem", "decme"))
res2
error(res2)

# we can't plot the results, because we did not store the objective function value at each iteration
# Changing the options to store the objective function values, we can:
res1keep <- turboem(par=p0, y=y, fixptfn=fixptfn, objfn=objfn, method=c("EM", "squarem", "pem"), 
  control.run=list(keep.objfval=TRUE))
plot(res1keep, xlim=c(0.001, 0.02))



