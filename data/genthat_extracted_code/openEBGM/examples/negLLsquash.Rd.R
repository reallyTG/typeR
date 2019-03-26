library(openEBGM)


### Name: negLLsquash
### Title: Likelihood with data squashing and no zero counts
### Aliases: negLLsquash
### Keywords: openEBGM

### ** Examples

theta_init <- c(0.2, 0.1, 2, 4, 1/3)  #initial guess
data(caers)
proc <- processRaw(caers)
squashed <- squashData(proc, count = 1, bin_size = 100, keep_pts = 100)
squashed <- squashData(squashed, count = 2, bin_size = 10, keep_pts = 20)
negLLsquash(theta = theta_init, ni = squashed$N, ei = squashed$E,
            wi = squashed$weight)
#For hyperparameter estimation...
stats::nlminb(start = theta_init, objective = negLLsquash, ni = squashed$N,
              ei = squashed$E, wi = squashed$weight)




