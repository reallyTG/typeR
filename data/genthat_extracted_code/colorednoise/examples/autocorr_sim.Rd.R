library(colorednoise)


### Name: autocorr_sim
### Title: Simulate Temporally Autocorrelated Populations for Every
###   Combination of Parameters
### Aliases: autocorr_sim

### ** Examples

survival_range <- autocorr_sim(timesteps = 30, start = 200, survPhi = 0.3, fecundPhi = 0.1,
                               survMean = c(0.2, 0.3, 0.4, 0.5, 0.6), survSd = 0.5,
                               fecundMean = 1.1, fecundSd = 0.5, replicates = 50)
head(survival_range[[1]])



