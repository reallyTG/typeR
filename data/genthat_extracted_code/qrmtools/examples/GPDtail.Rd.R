library(qrmtools)


### Name: GPDtail
### Title: GPD-Based Tail Distribution (POT method)
### Aliases: dGPDtail pGPDtail qGPDtail rGPDtail
### Keywords: distribution

### ** Examples

## Data we work with
data(fire) # load the Danish fire insurance data
X <- fire

## Determine thresholds for POT method
mean_excess_plot(X[X > 0])
abline(v = 10)
u <- 10 # threshold

## Fit GPD to the excesses (per margin)
fit <- fit_GPD_MLE(X[X > u] - u)
fit$par

## Estimate threshold exceedance probabilities
p.exceed <- mean(X > u)

## Define corresponding densities, distribution function and RNG
dF <- function(x) dGPDtail(x, threshold = u, p.exceed = p.exceed,
                           shape = fit$par["shape"], scale = fit$par["scale"])
pF <- function(q) pGPDtail(q, threshold = u, p.exceed = p.exceed,
                           shape = fit$par["shape"], scale = fit$par["scale"])
rF <- function(n) rGPDtail(n, threshold = u, p.exceed = p.exceed,
                           shape = fit$par["shape"], scale = fit$par["scale"])

## Basic check of dF()
curve(dF, from = 8, to = 20)
abline(v = u, lty = 2) # threshold

## Basic check of pF()
curve(pF, from = u, to = 20, ylim = 0:1) # quite flat here
abline(v = u, h = 1-p.exceed, lty = 2) # mass at u is 1-p.exceed (see 'Details')

## Basic check of rF()
set.seed(271)
X. <- rF(1000)
plot(X.)
stopifnot(all.equal(mean(X. == u), 1-p.exceed, tol = 5e-3)) # confirms the above
## Pick out 'continuous part'
X.. <- X.[X. > u]
plot(pF(X..)) # should be U[1-p.exceed, 1]



