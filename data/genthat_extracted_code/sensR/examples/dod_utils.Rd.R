library(sensR)


### Name: dod_utils
### Title: Utility functions for the Degree-of-Difference model
### Aliases: optimal_tau par2prob_dod dod_nll dod_null dod_null_tau
### Keywords: models

### ** Examples


## Compute optimal boundary parameters using the LR.max criterion for
## d.prime=1 with 4 categories:
dp <- 1
(Tau <- optimal_tau(d.prime=dp, d.prime0 = 0, ncat=4,
                    method="LR.max")$tau)
##  [1] 1.244642 2.109140 3.098985
## This set of boundary parameters optimize the power of the DOD test
## with d.prime = 1 under the alternative hypothesis.

## Compute the probability that an observation will fall in each of
## the (here 2*4=8) response categories given values of tau and d.prime:
par2prob_dod(tau=Tau, d.prime=dp)
##              [,1]      [,2]      [,3]       [,4]
##  p.same 0.6211921 0.2429480 0.1074307 0.02842911
##  p.diff 0.5124361 0.2571691 0.1596425 0.07075227

## Compute the negative log-likelihood given data and parameters:
Same <- c(10, 20, 30, 20)
Diff <- c(10, 10, 20, 40)
dod_nll(tau=Tau, d.prime=dp, same=Same,
        diff=Diff)
##  [1] 334.0986

## Compute the negative log-likelihood under the null hypothesis
## (where d.prime = 0):
dod_null(same=Same, diff=Diff)
##  [1] 208.8154
##  ## The boundary parameters for this:
(Tau0 <- dod_null_tau(same=Same, diff=Diff))
##  [1] 0.2224709 0.5688675 1.2546147

## Some equalities:
stopifnot(
    dod_nll(tau=Tau0, d.prime=0, same=Same, diff=Diff) ==
    dod_null(same=Same, diff=Diff))
stopifnot(
    dod_null(same=Same, diff=Diff) ==
    -dod_fit(same=Same, diff=Diff, d.prime=0)$logLik
    )
stopifnot(
    dod_nll(same=Same, diff=Diff, tau=Tau, d.prime=dp) ==
    -dod_fit(same=Same, diff=Diff, tau=Tau, d.prime=dp)$logLik
    )
stopifnot(all(
    dod_null_tau(same=Same, diff=Diff) ==
    dod_fit(Same, Diff, d.prime=0)$tau))

## Don't show: 
## set.seed(1)
## a <- dodSim(sample.size = 10, replicates = 3, d.prime = 2,
##            method = "triangle", sd.indiv = 1)
## expect <- c(3L, 3L, 2L, 3L, 3L, 1L, 3L, 3L, 1L, 2L)
## stopifnot(all(a == expect))
## 
## End(Don't show)



