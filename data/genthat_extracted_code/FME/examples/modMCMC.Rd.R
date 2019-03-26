library(FME)


### Name: modMCMC
### Title: Constrained Markov Chain Monte Carlo
### Aliases: modMCMC summary.modMCMC plot.modMCMC pairs.modMCMC
###   hist.modMCMC
### Keywords: utilities

### ** Examples


## =======================================================================
## Sampling a 3-dimensional normal distribution,
## =======================================================================
# mean = 1:3, sd = 0.1
# f returns -2*log(probability) of the parameter values

NN <- function(p) {
  mu <- c(1,2,3)
  -2*sum(log(dnorm(p, mean = mu, sd = 0.1)))   #-2*log(probability)
}

# simple Metropolis-Hastings
MCMC <- modMCMC(f = NN, p = 0:2, niter = 5000,
                outputlength = 1000, jump = 0.5)

# More accepted values by updating the jump covariance matrix...
MCMC <- modMCMC(f = NN, p = 0:2, niter = 5000, updatecov = 100,
                 outputlength = 1000, jump = 0.5)
summary(MCMC)

plot(MCMC)   # check convergence
pairs(MCMC)

## =======================================================================
## test 2: sampling a 3-D normal distribution, larger standard deviation...
## noninformative priors, lower and upper bounds imposed on parameters
## =======================================================================

NN <- function(p) {
  mu <- c(1,2,2.5)
  -2*sum(log(dnorm(p, mean = mu, sd = 0.5)))   #-2*log(probability)
}

MCMC2 <- modMCMC(f = NN, p = 1:3, niter = 2000, burninlength = 500,
  updatecov = 10, jump = 0.5, lower = c(0, 2, 1), upper = c(1, 3, 3))
plot(MCMC2)
hist(MCMC2, breaks = 20)

## Compare output of p3 with theoretical distribution
hist(MCMC2, which = "p3", breaks = 20)
lines(seq(1, 3, 0.1), dnorm(seq(1, 3, 0.1), mean = 2.5,
  sd = 0.5)/pnorm(3, 2.5, 0.5))
summary(MCMC2)

# functions from package coda...
cumuplot(as.mcmc(MCMC2$pars))
summary(as.mcmc(MCMC2$pars))
raftery.diag(MCMC2$pars)

## =======================================================================
## test 3: sampling a log-normal distribution, log mean=1:4, log sd = 1
## =======================================================================

NL <- function(p) {
  mu <- 1:4
  -2*sum(log(dlnorm(p, mean = mu, sd = 1)))      #-2*log(probability)
}
MCMCl <- modMCMC(f = NL, p = log(1:4), niter = 3000,
                 outputlength = 1000, jump = 5)
plot(MCMCl)   # bad convergence
cumuplot(as.mcmc(MCMCl$pars))

MCMCl <- modMCMC (f = NL, p = log(1:4), niter = 3000,
                  outputlength = 1000, jump = 2^(2:5))
plot(MCMCl)   # better convergence but CHECK it!
pairs(MCMCl)
colMeans(log(MCMCl$pars))
apply(log(MCMCl$pars), 2, sd)

MCMCl <- modMCMC (f = NL, p = rep(1, 4), niter = 3000, 
                  outputlength = 1000, jump = 5, updatecov = 100)
plot(MCMCl)
colMeans(log(MCMCl$pars))
apply(log(MCMCl$pars), 2, sd)

## =======================================================================
## Fitting a Monod (Michaelis-Menten) function to data
## =======================================================================

# the observations
#---------------------
Obs <- data.frame(x=c(   28,  55,   83,  110,  138,  225,  375),   # mg COD/l
                  y=c(0.053,0.06,0.112,0.105,0.099,0.122,0.125))   # 1/hour
plot(Obs, pch = 16, cex = 2, xlim = c(0, 400), ylim = c(0, 0.15),
     xlab = "mg COD/l", ylab = "1/hr", main = "Monod")

# the Monod model
#---------------------
Model <- function(p, x) data.frame(x = x, N = p[1]*x/(x+p[2]))

# Fitting the model to the data
#---------------------
# define the residual function
Residuals  <- function(p) (Obs$y - Model(p, Obs$x)$N)

# use modFit to find parameters
P      <- modFit(f = Residuals, p = c(0.1, 1))

# plot best-fit model
x      <-0:375
lines(Model(P$par, x))

# summary of fit
sP    <- summary(P)
sP[]
print(sP)

# Running an MCMC
#---------------------
# estimate parameter covariances
# (to efficiently generate new parameter values)
Covar   <- sP$cov.scaled * 2.4^2/2

# the model variance
s2prior <- sP$modVariance

# set nprior = 0 to avoid updating model variance
MCMC <- modMCMC(f = Residuals, p = P$par,jump = Covar, niter = 1000,
                var0 = s2prior, wvar0 = NULL, updatecov = 100)

plot(MCMC, Full = TRUE)
pairs(MCMC)
# function from the coda package.
raftery.diag(as.mcmc(MCMC$pars))
cor(MCMC$pars)

cov(MCMC$pars)   # covariances by MCMC
sP$cov.scaled    # covariances by Hessian of fit

x  <- 1:400
SR <- summary(sensRange(parInput = MCMC$pars, func = Model, x = x))
plot(SR, xlab="mg COD/l", ylab = "1/hr", main = "Monod")
points(Obs, pch = 16, cex = 1.5)




