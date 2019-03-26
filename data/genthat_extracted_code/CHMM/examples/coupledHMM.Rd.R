library(CHMM)


### Name: coupledHMM
### Title: Perform inference of coupled hidden markov models.
### Aliases: coupledHMM

### ** Examples

data(toyexample)
# Variational inference of a coupled hidden Markov Chains
resCHMM <- coupledHMM(X = toydata, nb.states = 3, S = cor(toystatus),
                      omega.list = c(0.3, 0.5, 0.7, 0.9))
# Breakpoints positions and status of segments
info <- clusterseg(resCHMM$status)
# head(info)



