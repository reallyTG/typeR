library(openEBGM)


### Name: exploreHypers
### Title: Explore various hyperparameter estimates
### Aliases: exploreHypers
### Keywords: openEBGM

### ** Examples

#Start with 2 or more guesses
theta_init <- data.frame(
  alpha1 = c(0.2, 0.1),
  beta1  = c(0.1, 0.1),
  alpha2 = c(2,   10),
  beta2  = c(4,   10),
  p      = c(1/3, 0.2)
)
data(caers)
proc <- processRaw(caers)
squashed <- squashData(proc, bin_size = 100, keep_pts = 100)
squashed <- squashData(squashed, count = 2, bin_size = 10, keep_pts = 20)
suppressWarnings(
  exploreHypers(squashed, theta_init = theta_init)
)




