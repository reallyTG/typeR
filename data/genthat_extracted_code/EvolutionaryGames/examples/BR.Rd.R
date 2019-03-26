library(EvolutionaryGames)


### Name: BR
### Title: BR dynamic
### Aliases: BR

### ** Examples

dynamic <- BR
A <- matrix(c(0, -2, 1, 1, 0, -2, -2, 1, 0), 3, byrow=TRUE)
state <- matrix(c(0.4, 0.3, 0.3), 1, 3, byrow=TRUE)
phaseDiagram3S(A, dynamic, NULL, state, FALSE, FALSE)



