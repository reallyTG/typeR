library(EvolutionaryGames)


### Name: phaseDiagram4S
### Title: Phase Diagram for two-player games with four strategies
### Aliases: phaseDiagram4S

### ** Examples

A <- matrix(c(5, -9, 6, 8, 20, 1, 2, -18, -14, 0, 2, 20, 13, 0, 4, -13),
 4, 4, byrow=TRUE)
state <- c(0.3, 0.2, 0.1, 0.4)
phaseDiagram4S(A, Replicator, NULL, state)



