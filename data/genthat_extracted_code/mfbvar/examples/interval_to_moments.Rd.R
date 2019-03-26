library(mfbvar)


### Name: interval_to_moments
### Title: Interval to moments
### Aliases: interval_to_moments
### Keywords: internal

### ** Examples

prior_intervals <- matrix(c(0.1, 0.2,
                            0.4, 0.6), ncol = 2, byrow = TRUE)
psi_moments <- interval_to_moments(prior_intervals)



