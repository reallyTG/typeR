library(EvolutionaryGames)


### Name: Logit
### Title: Logit dynamic
### Aliases: Logit

### ** Examples

dynamic <- Logit
A <- matrix(c(0, -2, 1, 1, 0, -2, -2, 1, 0), 3, byrow=TRUE)
state <- matrix(c(0.4, 0.3, 0.3), 1, 3, byrow=TRUE)
eta <- 0.1
phaseDiagram3S(A, dynamic, eta, state, FALSE, FALSE)



