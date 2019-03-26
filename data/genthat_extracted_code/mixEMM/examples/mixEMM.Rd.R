library(mixEMM)


### Name: mixEMM
### Title: A mixed-effects model for analyzing cluster-level non-ignorable
###   missing data
### Aliases: mixEMM

### ** Examples

data(sim_dat)

Z = sim_dat$X[, 1, , drop = FALSE]
fit0 = mixEMM(Ym = sim_dat$Ym, Xm = sim_dat$X, Zm = Z, gamma = 0.14)



