library(bpp)


### Name: bpp_2interim
### Title: Bayesian Predictive Power (BPP) for Normally Distributed
###   Endpoint
### Aliases: bpp_2interim
### Keywords: htest

### ** Examples

## No test: 
 
# ------------------------------------------------------------------------------------------
# Illustrate the update after two passed interims using the Gallium clinical trial
# ------------------------------------------------------------------------------------------

# ------------------------------------------
# set all parameters:
# ------------------------------------------
# prior mean / sd
hr0 <- 0.9288563
priormean <- log(hr0)
priorsigma <- sqrt(4 / 12)

# specifications for pivotal study
propA <- 0.5   # proportion of patients randomized to arm A
fac <- (propA * (1 - propA)) ^ (-1)
nevents <- c(111, 248, 370)
datasigma <- sqrt(fac / nevents[1:2])
finalsigma <- sqrt(fac / nevents[3])
za <- c(3.9285726330559, 2.5028231888636, 1.9936294555664)
alphas <- 2 * (1 - pnorm(za))
hrMDD <- exp(- za * sqrt(fac / nevents))
successmean <- log(hrMDD[3])

# efficacy and futility interim boundary
effi <- log(c(0, hrMDD[2]))
futi <- log(c(1, Inf))

# grid to compute densities on
thetas <- seq(-0.65, 0.3, by = 0.01)

bpp_2interim(prior = "normal", datasigma = datasigma, finalsigma = finalsigma, 
             successmean = successmean, IntEffBoundary = effi, IntFutBoundary = futi, 
             priormean = priormean, thetas = thetas, priorsigma = priorsigma)
## End(No test)


