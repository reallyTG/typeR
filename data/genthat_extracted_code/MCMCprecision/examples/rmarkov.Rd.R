library(MCMCprecision)


### Name: rmarkov
### Title: Generate a sample of a discrete-state Markov chain
### Aliases: rmarkov

### ** Examples

P <- matrix(c(.30, .50, .20,
              .05, .25, .70,
              .00, .10, .90), 3, 3, byrow=TRUE)
rmarkov(50, P)



