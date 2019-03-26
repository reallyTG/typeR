library(EvolutionaryGames)


### Name: ILogit
### Title: ILogit dynamic
### Aliases: ILogit

### ** Examples

dynamic <- ILogit
A <- matrix(c(-1, 0, 0, 0, -1, 0, 0, 0, -1), 3, byrow=TRUE)
state <- matrix(c(0.1, 0.2, 0.7, 0.2, 0.7, 0.1, 0.9, 0.05, 0.05), 3, 3, byrow=TRUE)
eta <- 0.7
phaseDiagram3S(A, dynamic, eta, state, TRUE, FALSE)



