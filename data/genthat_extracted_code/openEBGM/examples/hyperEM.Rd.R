library(openEBGM)


### Name: hyperEM
### Title: Estimate hyperparameters using an EM algorithm
### Aliases: hyperEM
### Keywords: openEBGM

### ** Examples

data(caers)
proc <- processRaw(caers)
squashed <- squashData(proc, bin_size = 100, keep_pts = 0)
squashed <- squashData(squashed, count = 2, bin_size = 12, keep_pts = 24)
hyperEM(squashed, theta_init_vec = c(1, 1, 2, 2, .3), consecutive = 10)




