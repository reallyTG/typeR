library(bssm)


### Name: sim_smoother
### Title: Simulation Smoothing
### Aliases: sim_smoother

### ** Examples

model <- bsm(rep(NA, 50), sd_level = uniform(1,0,5), sd_y = uniform(1,0,5))
sim <- sim_smoother(model, 12)
ts.plot(sim[, 1, ])



