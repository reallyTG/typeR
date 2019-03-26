library(smam)


### Name: fitStateMRH
### Title: Estimation of states at each time point with
###   Moving-Resting-Handling Process
### Aliases: fitStateMRH fitViterbiMRH fitPartialViterbiMRH

### ** Examples

## No test: 
set.seed(06269)
tgrid <- seq(0, 400, by = 8)
dat <- rMRH(tgrid, 4, 0.5, 0.1, 5, 0.8, 'm')
fitStateMRH(dat, c(4, 0.5, 0.1, 5, 0.8))
fitViterbiMRH(dat, c(4, 0.5, 0.1, 5, 0.8))
fitPartialViterbiMRH(dat, c(4, 0.5, 0.1, 5, 0.8), 20, 10)
## End(No test)




