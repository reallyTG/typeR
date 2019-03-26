library(adaptsmoFMRI)


### Name: sim.adaptiveGMRF
### Title: Adaptive GMRF Model for Simulated Data
### Aliases: sim.adaptiveGMRF

### ** Examples

# non-transformed hr-function
T <- 210
seq.length <- T*3
index <- seq(3, T*3, by = 3)
hrf <- rep(c(-0.5, 0.5), each=30, times=ceiling(T/30*1.5))
hrf <- as.matrix(hrf[index])
# get simulated data
data("sim_fmri")
data <- data_simfmri
# execute function
set.seed(111222)
K <- 2
a <- b <- c <- d <- nu <- 1
test.sim.adaptive <- sim.adaptiveGMRF(data, hrf, approximate=TRUE, K,
                                      a, b, c, d, nu)



