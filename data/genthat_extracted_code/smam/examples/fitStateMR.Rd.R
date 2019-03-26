library(smam)


### Name: fitStateMR
### Title: Estimation of states at each time point with Moving-Resting
###   Process
### Aliases: fitStateMR fitViterbiMR fitPartialViterbiMR

### ** Examples

set.seed(06269)
tgrid <- seq(0, 400, by = 8)
dat <- rMR(tgrid, 4, 3.8, 5, 'm')
fitStateMR(dat, c(4, 3.8, 5))
fitViterbiMR(dat, c(4, 3.8, 5))
fitPartialViterbiMR(dat, c(4, 3.8, 5), 20, 10)




