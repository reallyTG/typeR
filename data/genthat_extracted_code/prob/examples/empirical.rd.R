library(prob)


### Name: empirical
### Title: Empirical Summary of a Simulation
### Aliases: empirical
### Keywords: manip

### ** Examples

S <- tosscoin(2, makespace = TRUE)
sims <- sim(S, ntrials = 50000)
empirical(sims)



