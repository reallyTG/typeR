library(epiR)


### Name: epi.noninfb
### Title: Estimate the sample size for a parallel non-inferiority trial,
###   binary outcomes
### Aliases: epi.noninfb
### Keywords: univar

### ** Examples

## EXAMPLE 1:
## Suppose it is of interest to establish non-inferiority of a new treatment 
## as compared to the currently used standard treatment. A difference of less
## than 10% is of no clinical importance. Thus, the non-inferiority margin 
## (delta) is set at 0.10. Assume the true cure rate for the new treatment
## is 0.85 and the control is 0.65. Assuming a one-sided test size of 2.5% and 
## a power of 90% how many subjects should be included in the trial?

epi.noninfb(treat = 0.85, control = 0.65, delta = 0.10, n = NA, r = 1,
   power = 0.80, alpha = 0.025)

## A total of 558 subjects need to be enrolled in the trial, 279 in the 
## treatment group and 279 in the control group.

## EXAMPLE 1 (cont.):
## Suppose only 400 subjects were enrolled in the trial, 200 in the treatment
## group and 200 in the control group. What is the estimated study power?

epi.noninfb(treat = 0.85, control = 0.65, delta = 0.10, n = 400, r = 1,
   power = NA, alpha = 0.025)

## With only 500 subjects the estimated study power is 0.66.




